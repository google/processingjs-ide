/*
Copyright 2018 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package db

import (
	"testing"

	"golang.org/x/net/context"
)

func TestID(t *testing.T) {
	tests := []struct {
		ID
		want string
	}{
		{1, "1"},
		{1234567, "qglj"},
	}
	for _, tt := range tests {
		got := tt.ID.String()
		if got != tt.want {
			t.Errorf("ID %d converted to string %q, want %q", tt.ID, got, tt.want)
		}
		gotID, err := ParseID(got)
		if err != nil {
			t.Errorf("ParseID(%q) returned error %s, want success", got, err)
		}
		if gotID != tt.ID {
			t.Errorf("ParseID(%q) returned %d, want %d", got, gotID, tt.ID)
		}
	}
}

func TestMemDB(t *testing.T) {
	db := NewMemoryDB()
	// Check that there is a default sketch with ID 1.
	var ctx context.Context
	sketch, err := db.GetSketch(ctx, 1)
	if err != nil {
		t.Errorf("MemoryDB does not have default sketch with ID 1: %s", err)
	}
	content := "// content"
	sketch.Source = []byte(content)
	err = db.UpdateSketch(ctx, sketch)
	if err != nil {
		t.Errorf("UpdateSketch failed: %s", err)
	}
	sketch, err = db.GetSketch(ctx, 1)
	if err != nil {
		t.Errorf("MemoryDB does not have updated sketch with ID 1: %s", err)
	}
	if string(sketch.Source) != content {
		t.Errorf("UpdateSketch failed, got content %q, want %q", sketch.Source, content)
	}
	content = "// new content"
	newSketch := &Sketch{
		Source: []byte(content),
	}
	id, err := db.CreateSketch(ctx, newSketch)
	if err != nil {
		t.Errorf("CreateSketch failed: %s", err)
	}
	if !(id > 1) {
		t.Errorf("CreateSketch returned ID %d, wanted id > 1", id)
	}
	got, err := db.GetSketch(ctx, id)
	if err != nil {
		t.Errorf("GetSketch(%d) failed: %s", id, err)
	}
	if string(got.Source) != content {
		t.Errorf("CreateSketch failed, got content %q, want %q", got.Source, content)
	}
	err = db.Reset(ctx)
	if err != nil {
		t.Errorf("Reset failed: %s", err)
	}
	_, err = db.GetSketch(ctx, 1)
	if err == nil {
		t.Errorf("GetSketch(1) returns success after Reset, want error")
	}
}
