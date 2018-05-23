// Package database provides an abstraction to access persisent database.
package db

import (
	"errors"
	"fmt"
	"os"
	"strconv"
	"sync"
	"time"

	"golang.org/x/net/context"
	"google.golang.org/appengine"
	"google.golang.org/appengine/datastore"
)

// ID is the identifier for sketches.
type ID int64

func ParseID(key string) (ID, error) {
	// First try as base36
	id, err1 := strconv.ParseInt(key, 36, 64)
	if err1 == nil {
		return ID(id), nil
	}
	// Retry as datastore key.
	k, err2 := datastore.DecodeKey(key)
	if err2 == nil {
		return ID(k.IntID()), nil
	}
	return 0, fmt.Errorf("could not parse %q either as base36 (%s) or as datastore key (%s)", key, err1, err2)
}

func (id ID) String() string {
	// Format as base36.
	return strconv.FormatInt(int64(id), 36)
}

// Sketch keeps the information about sketch.
type Sketch struct {
	// ID is a unique identifier of the sketch.
	ID `datastore:"-"`
	// Source is the source code of the sketch.
	Source []byte
	// Title is the title of the sketch. Optional.
	Title string
	// Author is the authof of the sketch.
	Author string
	// Created is the timestamp of the sketch creation.
	Created time.Time
	// Modified is th timestamp of the last sketch modification.
	Modified time.Time
}

// Database provides access to the database (either in-memory database for testing
// or Cloud Datastore).
type Database interface {
	// GetSketch loads and returns a Sketch from the database
	GetSketch(ctx context.Context, id ID) (*Sketch, error)
	// CreateSketch creates a new sketch and returns its ID.
	CreateSketch(ctx context.Context, sketch *Sketch) (ID, error)
	// UpdateSketch updates an existing sketch.
	UpdateSketch(ctx context.Context, sketch *Sketch) error
	// ListSketches returns the list of sketches.
	// TODO(salikh): Avoid unscaleable API. Replace with the list of sketches owned by a session.
	ListSketches(ctx context.Context) ([]*Sketch, error)
	// Reset drops all the contents of the database.
	Reset(ctx context.Context) error
}

type memoryDB struct {
	mutex    sync.Mutex
	sketches map[ID]*Sketch
	nextID   ID
}

func NewMemoryDB() Database {
	return &memoryDB{
		sketches: map[ID]*Sketch{
			1: &Sketch{
				ID:    1,
				Title: "First",
				Source: []byte(`void setup() {
  size(300, 300);
  textSize(30); 
  color(0);
  text("Hello", 50, 50);
}

void draw() {
  noLoop();
}
`)},
		},
		nextID: 2,
	}
}

func (db *memoryDB) GetSketch(ctx context.Context, id ID) (*Sketch, error) {
	db.mutex.Lock()
	defer db.mutex.Unlock()
	sketch, ok := db.sketches[id]
	if ok {
		return sketch, nil
	}
	return nil, errors.New("not found")
}

func (db *memoryDB) CreateSketch(ctx context.Context, sketch *Sketch) (ID, error) {
	if sketch.ID != 0 {
		return 0, errors.New("sketch already has id")
	}
	db.mutex.Lock()
	defer db.mutex.Unlock()
	sketch.ID = db.nextID
	db.nextID++
	db.sketches[sketch.ID] = sketch
	return sketch.ID, nil
}

func (db *memoryDB) UpdateSketch(ctx context.Context, sketch *Sketch) error {
	db.mutex.Lock()
	defer db.mutex.Unlock()
	if sketch.ID == 0 {
		return errors.New("sketch has no id")
	}
	db.sketches[sketch.ID] = sketch
	return nil
}

func (db *memoryDB) ListSketches(ctx context.Context) ([]*Sketch, error) {
	var ret = make([]*Sketch, 0, len(db.sketches))
	for _, sketch := range db.sketches {
		ret = append(ret, sketch)
	}
	return ret, nil
}

func (db *memoryDB) Reset(ctx context.Context) error {
	db.sketches = make(map[ID]*Sketch)
	return nil
}

// datastoreDB uses Cloud Datastore for persistence.
type datastoreDB struct {
}

var projectIDEnviron = "DATASTORE_PROJECT_ID"

func GetProjectID(ctx context.Context) string {
	if osProjectID := os.Getenv(projectIDEnviron); osProjectID != "" {
		return osProjectID
	}
	return appengine.AppID(ctx)
}

// New returns a new Database based on Cloud Datastore.
func NewDatastore(ctx context.Context, projectID string) (Database, error) {
	return &datastoreDB{}, nil
}

func (db *datastoreDB) GetSketch(ctx context.Context, id ID) (*Sketch, error) {
	k := datastore.NewKey(ctx, "Sketch", "", int64(id), nil)
	sketch := &Sketch{}
	if err := datastore.Get(ctx, k, sketch); err != nil {
		return nil, fmt.Errorf("datastoredb: could not get Sketch: %v", err)
	}
	sketch.ID = id
	return sketch, nil
}

func (db *datastoreDB) CreateSketch(ctx context.Context, sketch *Sketch) (ID, error) {
	k := datastore.NewIncompleteKey(ctx, "Sketch", nil)
	k, err := datastore.Put(ctx, k, sketch)
	if err != nil {
		return 0, fmt.Errorf("datastoredb: could not put Sketch: %v", err)
	}
	return ID(k.IntID()), nil
}

// DeleteSketch removes a given book by its ID.
func (db *datastoreDB) DeleteSketch(ctx context.Context, id ID) error {
	k := datastore.NewKey(ctx, "Sketch", "", int64(id), nil)
	if err := datastore.Delete(ctx, k); err != nil {
		return fmt.Errorf("datastoredb: could not delete Sketch: %v", err)
	}
	return nil
}

// UpdateSketch updates the entry for a given sketch.
func (db *datastoreDB) UpdateSketch(ctx context.Context, sketch *Sketch) error {
	k := datastore.NewKey(ctx, "Sketch", "", int64(sketch.ID), nil)
	if _, err := datastore.Put(ctx, k, sketch); err != nil {
		return fmt.Errorf("datastoredb: could not update Sketch: %v", err)
	}
	return nil
}

// ListSketches returns a list of sketches, ordered by title.
func (db *datastoreDB) ListSketches(ctx context.Context) ([]*Sketch, error) {
	sketches := make([]*Sketch, 0)
	q := datastore.NewQuery("Sketch").
		Order("Title")

	keys, err := q.GetAll(ctx, &sketches)
	if err != nil {
		return nil, fmt.Errorf("datastoredb: could not list sketches: %v", err)
	}
	for i, k := range keys {
		sketches[i].ID = ID(k.IntID())
	}
	return sketches, nil
}

func (db *datastoreDB) Reset(ctx context.Context) error {
	q := datastore.NewQuery("Sketch").KeysOnly()
	keys, err := q.GetAll(ctx, nil)
	if err != nil {
		return fmt.Errorf("datastore error: %s", err)
	}
	err = datastore.DeleteMulti(ctx, keys)
	if err != nil {
		return fmt.Errorf("datastore error: %s", err)
	}
	return nil
}
