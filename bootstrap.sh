#!/usr/bin/env bash
set -e

echo Installing jsonnet-bundler
go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest

echo Creating empty jsonnetfile.json
touch jsonnetfile.json

echo Installing grafonnet
jb install github.com/grafana/grafonnet/gen/grafonnet-latest@main