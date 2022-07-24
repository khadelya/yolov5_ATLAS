#!/usr/bin/env bash

set -e

docker run \
	--rm \
	-ti \
	--mount type=bind,source="$(pwd)/input_data",target="/input_data" \
	--mount type=bind,source="$(pwd)/output_data",target="/output_data" \
	-e WORKER_CONFIG="/input_data/worker-config.json" \
	"adelya/object-detection-worker" \
	bash
