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

// Package tts provides a temporary solution for producing text-to-speech on server,
// using Google Cloud Text-to-Speech API.
package tts

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"

	"golang.org/x/net/context"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/google"
	"google.golang.org/appengine/urlfetch"
)

type Input struct {
	Text string `json:"text"`
}

type Voice struct {
	LanguageCode string `json:"languageCode"`
}

type AudioConfig struct {
	AudioEncoding string `json:"audioEncoding"`
}

type Request struct {
	Input       `json:"input"`
	Voice       `json:"voice"`
	AudioConfig `json:"audioConfig"`
}

var (
	ttsURL   = `https://texttospeech.googleapis.com/v1beta1/text:synthesize`
	ttsScope = `https://www.googleapis.com/auth/cloud-platform`
)

// Converts a given input text into a speech waveform
// (bytes in MP3 format).
func TextToMP3(ctx context.Context, text, language string) ([]byte, error) {
	if language == "" {
		return nil, fmt.Errorf("unspecified language")
	}
	ttsRequest := &Request{
		Input:       Input{text},
		Voice:       Voice{language},
		AudioConfig: AudioConfig{"MP3"},
	}
	jsonBytes, err := json.Marshal(ttsRequest)
	if err != nil {
		return nil, err
	}
	req, err := http.NewRequest("POST", ttsURL, bytes.NewReader(jsonBytes))
	req.Header.Set("Content-Type", "application/json")
	transport := &oauth2.Transport{
		Source: google.AppEngineTokenSource(ctx, ttsScope),
		Base:   &urlfetch.Transport{Context: ctx},
	}
	client := &http.Client{Transport: transport}
	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	buf := new(bytes.Buffer)
	_, err = buf.ReadFrom(resp.Body)
	if err != nil {
		return nil, err
	}
	result := make(map[string]interface{})
	err = json.Unmarshal(buf.Bytes(), &result)
	if err != nil {
		return nil, err
	}
	errObj, ok := result["error"]
	if ok {
		errMap, ok := errObj.(map[string]interface{})
		if ok {
			message, ok := errMap["message"]
			if ok {
				return nil, fmt.Errorf("error: %s (code %.0f, status %s)", message, errMap["code"], errMap["status"])
			}
		}
		return nil, fmt.Errorf("error: %s", errObj)
	}
	content64, ok := result["audioContent"].(string)
	if !ok {
		return nil, fmt.Errorf("unrecognized response format: %q", result)
	}
	content, err := base64.StdEncoding.DecodeString(content64)
	if err != nil {
		return nil, err
	}
	return content, nil
}
