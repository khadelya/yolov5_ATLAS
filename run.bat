docker run --rm -v C:\yolov5_docker\data:/data -e WORKER_CONFIG=/data/worker-config.json -it adelya/object-detection-worker bash

docker run --rm -v C:\yolov5_docker\data:/data -v C:\yolov5_docker\annotations:/annotations -e WORKER_CONFIG=/data/worker-config.json -it adelya/object-detection-worker /bin/bash