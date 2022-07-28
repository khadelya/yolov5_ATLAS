# Dockerization of YOLOv5

Running yolov5 training and inference on geospatial data in a docker container.

## Input data
Place the following files in the input_data directory:
- orthophoto.tif
- boat_ANNOTATIONS_TRAIN.json
- boat_ANNOTATIONS_MANUAL.json


## How to build
Run build script from the root of repository.
```bash
./build.sh
```

If everything is ok, you will see messages like this. 
```
Successfully built d7f06fb2cab3
Successfully tagged adelya/object-detection-worker:2dfbfdd0db44206cea0b588119d58c3d1d5f8d04
Successfully tagged adelya/object-detection-worker:latest
```

List of available versions.
```bash
docker image ls
```

To run the image inside of a container:
```bash
./run.sh
```

If yolov5 training gets killed at the first epoch add the following flag to the training command in entrypoint.sh :
```bash
--batch-size 5
```

