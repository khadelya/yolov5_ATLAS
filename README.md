# Dockerization of YOLOv5

Running YOLOv5 training and inference on aerial images in a certain map projection (orthophoto) labelled via GeoJSON (in WGS84 Coordinate System) inside of a docker container. As a result, you get a trained model and another GeoJSON file containing all the instances found by YOLOv5 (WGS84 Coordinate System).

## Dataset
- Images per class. ≥1.5k images per class
- Instances per class. ≥10k instances (labeled objects) per class total
- Image variety. Must be representative of deployed environment. For real-world use cases we recommend images from different times of day, different seasons, different weather, different lighting, different angles, different sources (scraped online, collected locally, different cameras) etc.
- Label consistency. All instances of all classes in all images must be labelled. Partial labelling will not work.
- Label accuracy. Labels must closely enclose each object. No space should exist between an object and it's bounding box. No objects should be missing a label.
- Background images. Background images are images with no objects that are added to a dataset to reduce False Positives (FP). We recommend about 0-10% background images to help reduce FPs (COCO has 1000 background images for reference, 1% of the total).

## Input data
Place the following files in the input_data directory :
- *.tif - orthophoto (image for training and inference containing instances of the object to be detected)/
- *_ANNOTATIONS_TRAIN.json - GeoJSON file containing areas in which objects are labelled.
- *_ANNOTATIONS_MANUAL.json - GeoJSON file containing labels of objects to be detected (with Polygons).

Check whether *_ANNOTATIONS_MANUAL.json is tagged with Polygons (otherwise it won't work).

Change dataset.yml (names -> name of the class to be detected), worker-config.json (paths to *.tif and *.json files).


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



To run the image inside of a container :
```bash
./run.sh
```


## Expected results
In the output_data directory should be the following files :
- ANNOTATIONS_GENERATED.json - GeoJSON file containing inference results in WGS84 Coordinate System.
- runs (which contains training results)
