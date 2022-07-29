#!/usr/bin/env bash

set -e
set -x

outputDir="$(pwd)/runs"
mkdir -p "${outputDir}"
docker run \
	--rm \
	-ti \
	--ipc=host \
	--mount type=bind,source="$(pwd)/input_data",target="/input_data" \
	--mount type=bind,source="${outputDir}",target="/runs" \
	-e WORKER_CONFIG="/input_data/worker-config.json" \
	"adelya/object-detection-worker" \
	bash
