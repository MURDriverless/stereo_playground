#pragma once
#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/core/cuda.hpp>
#include <tkDNN/Yolo3Detection.h>
#include "KeypointDetector.hpp"

#include "ConeROI.hpp"
#include "PreviewArgs.hpp"

// Detector class
class Detectors {
    private:

        // a DNN 
        std::unique_ptr<tk::dnn::DetectionNN> detNN;
        
        // keypoint regression's detector 
        std::unique_ptr<KeypointDetector> keypointDetector;
        
        // a bounding box used in the DNN 
        std::vector<tk::dnn::box> bbox;

        // yolo setup (?)
        static const int n_classes = 3;
        static const int n_batch = 1;

        // tkdnn setup (?)
        static const int keypointsW = 80;
        static const int keypointsH = 80;
        static const int maxBatch = 100;

    public:

        // constructor 
        Detectors();

        // destructor 
        // https://stackoverflow.com/questions/1395506/in-c-what-does-a-tilde-before-a-function-name-signify 
        ~Detectors(); 

        // initialise the detector with the object model and feature model 
        void initialize(std::string objectModel, std::string featureModel);

        // detect the frames 
        void detectFrame(const cv::Mat &imageFrame, std::vector<ConeROI> &coneROIs, const PreviewArgs& previewArgs = PreviewArgs());
};