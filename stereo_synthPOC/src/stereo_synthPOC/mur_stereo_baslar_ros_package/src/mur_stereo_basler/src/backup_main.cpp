/*

23.06.2021
What does this code do?

It uses the cameras to capture images 


*/

#include <iostream>

#include "ros/ros.h" // Must include for all ROS C++
#include "sensor_msgs/Image.h" 
#include <sstream>

#include <opencv2/core.hpp>

#include "raw_image.h"

#include "Detectors.hpp"
#include "ClassicalStereo.hpp"
#include "PreviewArgs.hpp"

#include "GeniWrap.hpp"

#define PREVIEW

#ifndef SRC_ROOT_PATH
#define SRC_ROOT_PATH "./"
#endif

const std::string CAMARA_NAME_L = "CameraLeft (40068492)";
const std::string CAMARA_NAME_R = "CameraRight (40061679)";

unsigned int grabCount = 20;

// camera class 
class StereoImageAcq{
    // private:
    // Variables for Current Pose
    int height;
    int width;
    std::string encoding;
    uint8_t is_bigendian;
    uint32_t step;
    // std::vector<uint8_t> left_image;
    // std::vector<uint8_t> right_image;
    // std::vector<uint8_t> data; 
    uint8_t* left_image;
    uint8_t* right_image;

    // ROS
    ros::NodeHandle n; // Create its specific node handler
    ros::Publisher left_imagePublisher;
    ros::Publisher right_imagePublisher; 
    ros::Subscriber left_imageSubscriber;
    ros::Subscriber right_imageSubscriber;


    public:
    // Constructor
    StereoImageAcq() {
        this->left_imagePublisher = n.advertise<raw_image>("/imagePublisher/left_image", 10);
        this->right_imagePublisher = n.advertise<raw_image>("/imagePublisher/right_image", 10);
        this->left_imageSubscriber = n.subscribe("/imagePublisher/left_image", 10, &StereoImageAcq::leftImageCallBack, this);
        this->height = 1200; 
        this->width = 1920; 
    }

    void publish_left_image() {
        raw_image left_img_msg;
        // sensor_msgs::Image left_img_msg;
        left_img_msg.data = this->left_image;

        this->left_imagePublisher.publish(left_img_msg);
    }

    void publish_right_image() {
        raw_image right_img_msg;

        // sensor_msgs::Image right_img_msg;
        right_img_msg.data = this->right_image;

        this->right_imagePublisher.publish(right_img_msg);
    }

    void leftImageCallBack(const sensor_msgs::Image::ConstPtr& msg)
    {
        this->data = msg->data;
        uint8_t* buffer1 = (this->data).data();
        // cv::Mat inMat = cv::Mat(this->height, this->width, CV_8UC3, buffer1);
        // cv::Mat dst;
        // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
        // cv::imshow("Left camera", dst);
        // cv::waitKey(100);
    }

    void set_left_image(uint8_t*  buffer1) {

        this->left_image = buffer1; 

        // int N = 7;
        // std::vector<uint8_t> temp(buffer1[0], buffer1[N]);
        // for (int i=0; i<temp.size(); i++)
        // this->left_image.push_back(temp[i]);

        // uint8_t* buffer2 = temp.data();

        // cv::Mat inMat = cv::Mat(this->height, this->width, CV_8UC1, buffer2);
        // cv::Mat dst;
        // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
        // cv::imshow("Left camera", dst);
        // cv::waitKey(100);
    }

    void set_right_image(uint8_t*  buffer2) {
        // int N = 7;
        // std::vector<uint8_t> temp(&buffer2[0], &buffer2[N]);
        // for (int i=0; i<temp.size(); i++)
        // this->right_image.push_back(temp[i]);

        this->right_image = buffer2; 
    }
};

int main(int argc, char** argv) {

    // Initialize ROS node
    ros::init(argc, argv, "Stereo_Images_Acquisition");

    //Initialize Turtle Object
    StereoImageAcq stereo_image_acq = StereoImageAcq();

    // bounding box preview
    #ifdef PREVIEW
    cv::Mat rFrameBBox;
    cv::Mat lFrameBBox;
    cv::Mat matchesPreview;
    PreviewArgs previewArgs(lFrameBBox, rFrameBBox, matchesPreview);
    #else
    PreviewArgs previewArgs = PreviewArgs();
    #endif /* PREVIEW */


    // calibration files for the left and right camera 
    // Prep Classical
    // std::string lCalibPath = std::string(SRC_ROOT_PATH).append("../calibration.xml");
    // std::string rCalibPath = std::string(SRC_ROOT_PATH).append("../calibration.xml");

    // const double baseline = 200.00;
    // cv::Ptr<cv::Feature2D> featureDetector = cv::xfeatures2d::SIFT::create();
    // cv::Ptr<cv::DescriptorMatcher> descriptorMatcher = cv::DescriptorMatcher::create(cv::DescriptorMatcher::FLANNBASED);
    // ClassicalStereo classical(lCalibPath, rCalibPath, baseline, featureDetector, descriptorMatcher);

    // std::cout << "created the classical stereo" << std::endl;

    //*********************************************************************************************
    // something about this section causes a segmentation fault (core dumped) error 

    // // Prep detectors
    // std::string coneRT = std::string(SRC_ROOT_PATH).append("../models/yolo4_cones_int8.rt");

    // std::cout << "prepped coneRT" << std::endl;

    // std::string keyPtsONNX = std::string(SRC_ROOT_PATH).append("../models/keypoints.onnx");

    // std::cout << "prepped keypoint onnx" << std::endl;

    // Detectors detectors;
    // detectors.initialize(coneRT, keyPtsONNX);
    
    //*********************************************************************************************

    // std::cout << "initialise the detector done" << std::endl;

    // Prep real cameras
    std::unique_ptr<IGeniCam> camera1;
    std::unique_ptr<IGeniCam> camera2;

    // std::cout << "before geni code" << std::endl;

    // run the cameras 
    camera1.reset(IGeniCam::create(GeniImpl::Pylon_i));
    camera2.reset(IGeniCam::create(GeniImpl::Pylon_i));
    
    // std::cout << "after geni cam code" << std::endl;

    camera1->initializeLibrary();
    camera2->initializeLibrary();
    
    int exitCode = 0;

    // std::cout << "initialising library" << std::endl;

    try {
        camera1->setup(CAMARA_NAME_L);
        camera2->setup(CAMARA_NAME_R);

        // std::cout << "entered try block" << std::endl;

        camera1->startGrabbing(grabCount);
        camera2->startGrabbing(grabCount);

        int imageCount = 0;
        auto first_camera1 = std::chrono::high_resolution_clock::now();
        auto first_camera2 = first_camera1;
        
        bool flag = true;

        while(ros::ok()) { // while ros is running, repeat this 
            while (imageCount < grabCount && camera1->isGrabbing()) {
                // Wait for an image and then retrieve it. A timeout of 5000 ms is used.

                // std::cout << "entered while loop" << std::endl;
                int height1;
                int width1;
                uint8_t* buffer1;
                //std::vector<uint8_t> buffer1;

                int height2;
                int width2;
                uint8_t* buffer2;
                // std::vector<uint8_t> buffer2;

                bool ret1 = camera1->retreiveResult(height1, width1, buffer1);
                bool ret2 = camera2->retreiveResult(height2, width2, buffer2);

                cv::Mat dst2;

                if (ret1) {
                    // int arrSize = sizeof(buffer1);
                    // std::cout << "The size of the array is: " << arrSize << std::endl;

                    // store the left image buffer in the ROS object
                    //stereo_image_acq.left_image = buffer1.copy(); 
                    // int length_of_buffer1 = sizeof(&buffer1); ///sizeof(uint8_t);

                    // std::cout << length_of_buffer1 << std::endl;

                    stereo_image_acq.set_left_image(buffer1);

                    // cv::Mat inMat = cv::Mat(height1, width1, CV_8UC3, buffer1);

                    // std::cout << "The width is: " << width1 << std::endl;
                    // std::cout << "The height is: " << height1 << std::endl;
                    // CV_8UC1 is grayscale 
                    // CV_8UC3 is BGR so it's coloured 
                    // cv::Mat dst;
                    // convert the color to RGB which is the default i.e. it's the correct convention used 
                    // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
                    // cv::destroyAllWindows();
                    // cv::imshow("Left camera", dst);
                    // cv::waitKey(100);

                    // char image_name[256];
                    // std::sprintf(image_name,"CameraLeft%04d_L.png", imageCount);
                    // cv::imwrite(image_name, dst);
                }
                auto camera1_done = std::chrono::high_resolution_clock::now();

                while (camera2 -> isGrabbing()) {
                    if (ret2) {
                        
                        // store the right image buffer in the ROS object 
                        stereo_image_acq.set_right_image(buffer2);

                        // cv::Mat inMat2 = cv::Mat(height2, width2, CV_8UC3, buffer2);
                        // CV_8UC1 is grayscale 
                        // CV_8UC3 is BGR so it's coloured 
                        
                        // convert the color to RGB which is the default i.e. it's the correct convention used 
                        // cv::cvtColor(inMat2, dst2, cv::COLOR_BGR2RGB); 
                        
                        // cv::imshow("Right camera", dst2);
                        // cv::resizeWindow("Right camera", 800, 600);
                        // cv::waitKey(100);

                        // std::snprintf(pathBuf, 256, "%s/Image%04d_L.png", imFolder, frameNum);
                        // char image_name2[256];
                        // std::sprintf(image_name2,"CameraRight%04d_R.png", imageCount);
                        // cv::imwrite(image_name2, dst2);
                    }
                    break;
                }
                auto camera2_done = std::chrono::high_resolution_clock::now();

                double frameTime1 = std::chrono::duration_cast<std::chrono::milliseconds>(camera1_done - first_camera1).count();
                double frameTime2 = std::chrono::duration_cast<std::chrono::milliseconds>(camera2_done - first_camera2).count();

                std::cout << "camera 1 time is: " << frameTime1 << ", " << "camera 2 time is: " << frameTime2 << std::endl;

                first_camera1 = camera1_done; 
                first_camera2 = camera2_done;
                
                // cv::imshow("Right camera", dst2);
                // cv::waitKey(1000);

                imageCount++;

                // ROS: publisher 
                stereo_image_acq.publish_left_image();
                stereo_image_acq.publish_right_image();                
            }
            ros::spinOnce();
        }
    }
    catch (const std::exception &e)
    {
        std::cout << "entered catch block" << std::endl;
        // Error handling.
        std::cerr << "An exception occurred." << std::endl
        << e.what() << std::endl;
        exitCode = 1;
    }

    std::cout << "ending program" << std::endl;
    camera1->finalizeLibrary();
    camera2->finalizeLibrary();

    delete camera1.release();
    delete camera2.release();

    return exitCode;
}

/* 
/*

23.06.2021
What does this code do?

It uses the cameras to capture images 


*/

#include <iostream>

#include "ros/ros.h" // Must include for all ROS C++
#include "sensor_msgs/Image.h" 
#include <sstream>

#include <opencv2/core.hpp>

#include "Detectors.hpp"
#include "ClassicalStereo.hpp"
#include "PreviewArgs.hpp"

#include "GeniWrap.hpp"

#define PREVIEW

#ifndef SRC_ROOT_PATH
#define SRC_ROOT_PATH "./"
#endif

const std::string CAMARA_NAME_L = "CameraLeft (40068492)";
const std::string CAMARA_NAME_R = "CameraRight (40061679)";

unsigned int grabCount = 20;

// camera class 
class StereoImageAcq{
    // private:
    // Variables for Current Pose
    int height;
    int width;
    std::string encoding;
    uint8_t is_bigendian;
    uint32_t step;
    std::vector<uint8_t> left_image;
    std::vector<uint8_t> right_image;
    std::vector<uint8_t> data; 


    // ROS
    ros::NodeHandle n; // Create its specific node handler
    ros::Publisher left_imagePublisher;
    ros::Publisher right_imagePublisher; 
    ros::Subscriber left_imageSubscriber;
    ros::Subscriber right_imageSubscriber;


    public:
    // Constructor
    StereoImageAcq() {
        this->left_imagePublisher = n.advertise<sensor_msgs::Image>("/imagePublisher/left_image", 10);
        this->right_imagePublisher = n.advertise<sensor_msgs::Image>("/imagePublisher/right_image", 10);
        this->left_imageSubscriber = n.subscribe("/imagePublisher/left_image", 10, &StereoImageAcq::leftImageCallBack, this);
        this->height = 1200; 
        this->width = 1920; 
    }

    void publish_left_image() {
        sensor_msgs::Image left_img_msg;
        left_img_msg.data = this->left_image;

        this->left_imagePublisher.publish(left_img_msg);
    }

    void publish_right_image() {
        sensor_msgs::Image right_img_msg;
        right_img_msg.data = this->right_image;

        this->right_imagePublisher.publish(right_img_msg);
    }

    void leftImageCallBack(const sensor_msgs::Image::ConstPtr& msg)
    {
        this->data = msg->data;
        uint8_t* buffer1 = (this->data).data();
        // cv::Mat inMat = cv::Mat(this->height, this->width, CV_8UC3, buffer1);
        // cv::Mat dst;
        // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
        // cv::imshow("Left camera", dst);
        // cv::waitKey(100);
    }

    void set_left_image(uint8_t*  buffer1) {
        int N = 7;
        std::vector<uint8_t> temp(buffer1[0], buffer1[N]);
        for (int i=0; i<temp.size(); i++)
        this->left_image.push_back(temp[i]);

        uint8_t* buffer2 = temp.data();

        cv::Mat inMat = cv::Mat(this->height, this->width, CV_8UC1, buffer2);
        cv::Mat dst;
        cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
        cv::imshow("Left camera", dst);
        cv::waitKey(100);
    }

    void set_right_image(uint8_t*  buffer2) {
        int N = 7;
        std::vector<uint8_t> temp(&buffer2[0], &buffer2[N]);
        for (int i=0; i<temp.size(); i++)
        this->right_image.push_back(temp[i]);
    }
};

int main(int argc, char** argv) {

    // Initialize ROS node
    ros::init(argc, argv, "Stereo_Images_Acquisition");

    //Initialize Turtle Object
    StereoImageAcq stereo_image_acq = StereoImageAcq();

    // bounding box preview
    #ifdef PREVIEW
    cv::Mat rFrameBBox;
    cv::Mat lFrameBBox;
    cv::Mat matchesPreview;
    PreviewArgs previewArgs(lFrameBBox, rFrameBBox, matchesPreview);
    #else
    PreviewArgs previewArgs = PreviewArgs();
    #endif /* PREVIEW */


    // calibration files for the left and right camera 
    // Prep Classical
    // std::string lCalibPath = std::string(SRC_ROOT_PATH).append("../calibration.xml");
    // std::string rCalibPath = std::string(SRC_ROOT_PATH).append("../calibration.xml");

    // const double baseline = 200.00;
    // cv::Ptr<cv::Feature2D> featureDetector = cv::xfeatures2d::SIFT::create();
    // cv::Ptr<cv::DescriptorMatcher> descriptorMatcher = cv::DescriptorMatcher::create(cv::DescriptorMatcher::FLANNBASED);
    // ClassicalStereo classical(lCalibPath, rCalibPath, baseline, featureDetector, descriptorMatcher);

    // std::cout << "created the classical stereo" << std::endl;

    //*********************************************************************************************
    // something about this section causes a segmentation fault (core dumped) error 

    // // Prep detectors
    // std::string coneRT = std::string(SRC_ROOT_PATH).append("../models/yolo4_cones_int8.rt");

    // std::cout << "prepped coneRT" << std::endl;

    // std::string keyPtsONNX = std::string(SRC_ROOT_PATH).append("../models/keypoints.onnx");

    // std::cout << "prepped keypoint onnx" << std::endl;

    // Detectors detectors;
    // detectors.initialize(coneRT, keyPtsONNX);
    
    //*********************************************************************************************

    // std::cout << "initialise the detector done" << std::endl;

    // Prep real cameras
    std::unique_ptr<IGeniCam> camera1;
    std::unique_ptr<IGeniCam> camera2;

    // std::cout << "before geni code" << std::endl;

    // run the cameras 
    camera1.reset(IGeniCam::create(GeniImpl::Pylon_i));
    camera2.reset(IGeniCam::create(GeniImpl::Pylon_i));
    
    // std::cout << "after geni cam code" << std::endl;

    camera1->initializeLibrary();
    camera2->initializeLibrary();
    
    int exitCode = 0;

    // std::cout << "initialising library" << std::endl;

    try {
        camera1->setup(CAMARA_NAME_L);
        camera2->setup(CAMARA_NAME_R);

        // std::cout << "entered try block" << std::endl;

        camera1->startGrabbing(grabCount);
        camera2->startGrabbing(grabCount);

        int imageCount = 0;
        auto first_camera1 = std::chrono::high_resolution_clock::now();
        auto first_camera2 = first_camera1;
        
        bool flag = true;

        while(ros::ok()) { // while ros is running, repeat this 
            while (imageCount < grabCount && camera1->isGrabbing()) {
                // Wait for an image and then retrieve it. A timeout of 5000 ms is used.

                // std::cout << "entered while loop" << std::endl;
                int height1;
                int width1;
                uint8_t* buffer1;
                //std::vector<uint8_t> buffer1;

                int height2;
                int width2;
                uint8_t* buffer2;
                // std::vector<uint8_t> buffer2;

                bool ret1 = camera1->retreiveResult(height1, width1, buffer1);
                bool ret2 = camera2->retreiveResult(height2, width2, buffer2);

                cv::Mat dst2;

                if (ret1) {
                    // int arrSize = sizeof(buffer1);
                    // std::cout << "The size of the array is: " << arrSize << std::endl;

                    // store the left image buffer in the ROS object
                    //stereo_image_acq.left_image = buffer1.copy(); 
                    int length_of_buffer1 = sizeof(&buffer1); ///sizeof(uint8_t);

                    std::cout << length_of_buffer1 << std::endl;

                    stereo_image_acq.set_left_image(buffer1);

                    // cv::Mat inMat = cv::Mat(height1, width1, CV_8UC3, buffer1);

                    // std::cout << "The width is: " << width1 << std::endl;
                    // std::cout << "The height is: " << height1 << std::endl;
                    // CV_8UC1 is grayscale 
                    // CV_8UC3 is BGR so it's coloured 
                    // cv::Mat dst;
                    // convert the color to RGB which is the default i.e. it's the correct convention used 
                    // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
                    // cv::destroyAllWindows();
                    // cv::imshow("Left camera", dst);
                    // cv::waitKey(100);

                    // char image_name[256];
                    // std::sprintf(image_name,"CameraLeft%04d_L.png", imageCount);
                    // cv::imwrite(image_name, dst);
                }
                auto camera1_done = std::chrono::high_resolution_clock::now();

                while (camera2 -> isGrabbing()) {
                    if (ret2) {
                        
                        // store the right image buffer in the ROS object 
                        stereo_image_acq.set_right_image(buffer2);

                        // cv::Mat inMat2 = cv::Mat(height2, width2, CV_8UC3, buffer2);
                        // CV_8UC1 is grayscale 
                        // CV_8UC3 is BGR so it's coloured 
                        
                        // convert the color to RGB which is the default i.e. it's the correct convention used 
                        // cv::cvtColor(inMat2, dst2, cv::COLOR_BGR2RGB); 
                        
                        // cv::imshow("Right camera", dst2);
                        // cv::resizeWindow("Right camera", 800, 600);
                        // cv::waitKey(100);

                        // std::snprintf(pathBuf, 256, "%s/Image%04d_L.png", imFolder, frameNum);
                        // char image_name2[256];
                        // std::sprintf(image_name2,"CameraRight%04d_R.png", imageCount);
                        // cv::imwrite(image_name2, dst2);
                    }
                    break;
                }
                auto camera2_done = std::chrono::high_resolution_clock::now();

                double frameTime1 = std::chrono::duration_cast<std::chrono::milliseconds>(camera1_done - first_camera1).count();
                double frameTime2 = std::chrono::duration_cast<std::chrono::milliseconds>(camera2_done - first_camera2).count();

                std::cout << "camera 1 time is: " << frameTime1 << ", " << "camera 2 time is: " << frameTime2 << std::endl;

                first_camera1 = camera1_done; 
                first_camera2 = camera2_done;
                
                // cv::imshow("Right camera", dst2);
                // cv::waitKey(1000);

                imageCount++;

                // ROS: publisher 
                stereo_image_acq.publish_left_image();
                stereo_image_acq.publish_right_image();                
            }
            ros::spinOnce();
        }
    }
    catch (const std::exception &e)
    {
        std::cout << "entered catch block" << std::endl;
        // Error handling.
        std::cerr << "An exception occurred." << std::endl
        << e.what() << std::endl;
        exitCode = 1;
    }

    std::cout << "ending program" << std::endl;
    camera1->finalizeLibrary();
    camera2->finalizeLibrary();

    delete camera1.release();
    delete camera2.release();

    return exitCode;
}