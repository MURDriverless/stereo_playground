# Stereo_SynthPOC
Currently used as a playground for testing and benchmarking of the stereo pipeline, as well as clean up of code.

**Will be removed in the future once integrated with original repo**

## Requirements/Compiled with
 - `CUDA` 10.0
 - `CUDNN` 7.6.3
 - `TensorRT` 7.0.0
 - `OpenCV` 4.1.1, Compiled with CUDA, CUDNN and Non-free addons
 - `tkDNN` 0.5
 - `vision_opencv` from [https://github.com/MURDriverless/vision_opencv](https://github.com/MURDriverless/vision_opencv)
 - `mur_common` from [https://github.com/MURDriverless/mur_common](https://github.com/MURDriverless/mur_common)

### Installing `tkDNN`
```
git clone https://github.com/ceccocats/tkDNN.git
cd tkDNN
git checkout v0.5
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
```

## Usage
 - Place models in `models/` for `keypoints.onnx` and `yolo4_cones_int8.rt`
 - `mur_stereo_ros_node` listens to `/mur/stereo_cam/left_image` and `/mur/stereo_cam/right_image`
    - Refer to [https://github.com/MURDriverless/synth_producer](https://github.com/MURDriverless/synth_producer) as an example.

## TODO:
 - [x] Seperate classical algorithm code from `main` function
 - [x] Untangle `CMakeList.txt`
 - [x] Removed hard coded camera properties
 - [x] Thing about code structure for `ClassicalLib` and `DetectorLib`
    - `ClassicalLib` and `DetectorsLib` moved to `StereoPipelineLib`, with `StereoCommon` for common structs.
 - [x] Fix up bounding box preview window
 - [x] Return cone color estimation in estimations
 - [x] ROS Integration
 - [x] Support for "Large Orange Cones" in addition to current Blue/Yellow
   - "Supported", but geometry is not programmed.
   - Think of a more elegant way to do it? Kinda "Hacky" right now.
 - [ ] Reintegrate with existing repo
 - [x] Find out why `catkin build` does not work?