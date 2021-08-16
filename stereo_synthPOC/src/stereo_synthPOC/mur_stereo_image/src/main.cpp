/*
23.06.2021
What does this code do? 

It loads in left and right images from a folder, undistorts them using their respective calibration files 
Then, it uses YOLO4, keypoint regression, and SIFT feature extractor to find the estimates of the cone position 

*/

#include <iostream>

#include <opencv2/core.hpp>

#include "Detectors.hpp"
#include "ClassicalStereo.hpp"
#include "PreviewArgs.hpp"

#define PREVIEW

#ifndef SRC_ROOT_PATH
#define SRC_ROOT_PATH "./"
#endif

int main(int argc, char** argv) {
    
    // what is in PreviewArgs? 
    // FrameBBox is the frame's bounding box 
    #ifdef PREVIEW
    cv::Mat rFrameBBox;
    cv::Mat lFrameBBox;
    cv::Mat matchesPreview;
    PreviewArgs previewArgs(lFrameBBox, rFrameBBox, matchesPreview);
    #else
    PreviewArgs previewArgs = PreviewArgs();
    #endif /* PREVIEW */

    // Read the calibration file for the left and right camera 
    std::string lCalibPath = std::string(SRC_ROOT_PATH).append("../calibration.xml");
    std::string rCalibPath = std::string(SRC_ROOT_PATH).append("../calibration.xml");

    // defined the baseline as 20cm 
    const double baseline = 200.00;

    // creates a SIFT feature extractor. 
    cv::Ptr<cv::Feature2D> featureDetector = cv::xfeatures2d::SIFT::create();
    
    // descriptor Matcher? 
    cv::Ptr<cv::DescriptorMatcher> descriptorMatcher = cv::DescriptorMatcher::create(cv::DescriptorMatcher::FLANNBASED);
    
    // a ClassicalStereo object that Andrew most likely created that bascially represents the stereo camera setup 
    // the calibration paths are passed in so that the methods for ClassicalStereo can be used to undistort the images 
    ClassicalStereo classical(lCalibPath, rCalibPath, baseline, featureDetector, descriptorMatcher);

    // Prep detectors
    std::string coneRT = std::string(SRC_ROOT_PATH).append("../models/yolo4_cones_int8.rt");
    std::string keyPtsONNX = std::string(SRC_ROOT_PATH).append("../models/keypoints.onnx");

    // create the detectors and intialise it to the YOLO4 and Key point regression algorithms to detect the cones and get the 7 point keypoint regression 
    // what's the RT in coneRT and ONNX in keyPts? 
    Detectors detectors;
    detectors.initialize(coneRT, keyPtsONNX);

    // declare an image folder for the output of yellow cones 
    const char imFolder[] = "../Output1/Yellow";

    // a path buffer array 
    char pathBuf[256];
    int frameNum = 1;

    // continuously loop
    while (true) {

        // if the image is named as such, load the name into the path buffer 
        std::snprintf(pathBuf, 256, "%s/Image%04d_L.png", imFolder, frameNum);

        // read the image into the variable, lFrame 
        cv::Mat lFrame = cv::imread(pathBuf);

        // if there's no data in the frame, that means there wasn't an image so end the function 
        if (lFrame.data == nullptr) {
            break;
        }

        // read the same thing for the right camera 
        std::snprintf(pathBuf, 256, "%s/Image%04d_R.png", imFolder, frameNum);
        cv::Mat rFrame = cv::imread(pathBuf);

        // Start Proc Block 
        // what are these two variables for?
        // undistorted!  
        cv::Mat lUnDist, rUnDist;

        // the classical object is of type, ClassicalStereo, a self-made class that defines the stereo camera setup
        // it has a method called preprocessorFramePair
        // So we're preprocessing the left and right frame pair i.e. for the same time instance 
        // how is the preprocessing done? 
        // preprocessing to undistort the images using the calibration file 
        classical.preprocessFramePair(lFrame, rFrame, lUnDist, rUnDist);

        // initialise a vector for coneROIS
        // coneROIs - region of interest i.e. the bounding box of the cones
        // see the header file for ConeROI.hpp for comments on what this is 
        std::vector<ConeROI> coneROIs;

        // the detector is an object of type, Detectors 
        // the detection produces the bounding boxes from the left frame and stores this in coneROIs 
        // the cones' region of interest and the colour of the cones are stored in "coneROIs"
        detectors.detectFrame(lUnDist, coneROIs, previewArgs);

        // coneEsts = cone estimates 
        std::vector<ConeEst> coneEsts; 

        // estimate the cone position using the undistorted images and previewArgs
        // what is previewArgs' role? 
        
        // the bounding box is given as a parameter. It is pass it onto the right frame then estimate the cone's position from there. 
        classical.estConePos(lUnDist, rUnDist, coneROIs, coneEsts, frameNum, previewArgs);

        // display a preview of the undistorted image 
        #ifdef PREVIEW
        cv::imshow("Camera_Undist1", lFrameBBox);
        cv::resizeWindow("Camera_Undist1", 1000, 600);
        cv::waitKey(1);

        cv::imshow("Camera_Undist2", rFrameBBox);
        cv::resizeWindow("Camera_Undist2", 1000, 600);
        cv::waitKey(1);

        // cv::imshow("Matches", matchesPreview);
        // cv::resizeWindow("Camera_Undist2", 1000, 600);
        // cv::waitKey(1);
        #endif /* PREVIEW */
        // End Proc Block

        // loop to check the next image 
        frameNum++;
    }

    return 0;
}