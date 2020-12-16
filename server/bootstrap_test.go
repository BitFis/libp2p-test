package main

import "testing"

func TestSomeFunc(t *testing.T) {
	t.Log("Hello World")
	if SomeFunc() != "Hello World" {
		t.Errorf("Expected a nice greating")
	}
}
