#!/usr/bin/env bash

set -e

currentVersion=$(git rev-parse HEAD)
baseImage="adelya/yolo"
versionTag="${baseImage}:${currentVersion}"
latesTag="${baseImage}:latest"
docker build \
	-t "${versionTag}" \
	-t "${latesTag}" \
	.

