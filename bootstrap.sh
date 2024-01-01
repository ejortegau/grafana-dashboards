#!/usr/bin/env bash
set -e


function die() {
    echo $1
    exit 1
}

echo Installing jsonnet-bundler
go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest || die "Failed to install jsonnet-bundler"

echo Installing grafonnet
jb install github.com/grafana/grafonnet/gen/grafonnet-v10.1.0@main || die "Failed to install grafonnet-latest"

echo Installing Grizzly jsonnet library
jb install github.com/grafana/jsonnet-libs/grizzly || die "Failed to install grizzly jsonnet libraries"

echo Please install grizzly binary following the directions in https://grafana.github.io/grizzly/installation/
echo Then configure it for your environment as described in https://grafana.github.io/grizzly/authentication/
