#!/usr/bin/env bash
set -e


function die() {
    echo $1
    exit 1
}

echo Installing jsonnet-bundler
go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest || die "Failed to install jsonnet-bundler"

echo Installing grafonnet
jb install github.com/grafana/grafonnet/gen/grafonnet-latest@main || die "Failed to install grafonnet-latest"

echo Please install grizzly following the directions in https://grafana.github.io/grizzly/installation/
echo Then configure it for your environment as described in https://grafana.github.io/grizzly/authentication/
