#!/bin/sh
set -eux

GO_VERSION=1.17.13
GO_BINARY=$(go env GOPATH)/bin/go$GO_VERSION

# this is the official way to get a different version of golang
# see https://go.dev/doc/manage-install
go install golang.org/dl/go$GO_VERSION@latest
$GO_BINARY download

# Ensure that all code has been regenerated from its sources
$GO_BINARY generate ./...

# ... the code is formatted correctly, ...
$GO_BINARY fmt ./...

# ... and that go.mod and go.sum are up to date.
$GO_BINARY mod tidy
$GO_BINARY mod vendor
