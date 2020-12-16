package server

import "testing"

func TestGetJson(t *testing.T) {
	t.Log("Some information")

	if SomeFunc() != "Hello World" {
		t.Errorf("Test failed")
	}
}
