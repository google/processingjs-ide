package tts

import (
	"encoding/json"
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

// Converts a given input text into a speech waveform
// (bytes in MP3 format).
func TextToMP3(text, language string) ([]byte, error) {
	if language == "" {
		language = "ja-JP"
	}
	req := &Request{
		Input:       Input{text},
		Voice:       Voice{language},
		AudioConfig: AudioConfig{"MP3"},
	}
	jsonBytes, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}
	return jsonBytes, nil
	/*
		req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonBytes))
		req.Header.Set("X-Custom-Header", "myvalue")
		req.Header.Set("Content-Type", "application/json")

		client := &http.Client{}
		resp, err := client.Do(req)
		if err != nil {
			panic(err)
		}
		defer resp.Body.Close()
	*/
}
