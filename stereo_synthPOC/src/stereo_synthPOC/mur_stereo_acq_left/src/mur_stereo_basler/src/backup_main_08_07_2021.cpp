/*

23.06.2021
What does this code do?

It uses the cameras to capture images 


*/

#include <ros/duration.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>

#include <opencv2/highgui.hpp>
#include <opencv2/calib3d.hpp>

#include <opencv2/core/cuda.hpp>
#include <opencv2/cudawarping.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudaimgproc.hpp>

#include <opencv2/xfeatures2d.hpp>
#include <opencv2/xfeatures2d/nonfree.hpp>
// #include <mur_common/cone_msg.h>

#include <iostream>

#include <ros/ros.h> // Must include for all ROS C++
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
int imageCount = 0;

struct GlobalFrames {
    cv::Mat lFrame;
    cv::Mat rFrame;

    int frameFlag = 0b00;
} globalFrames;



// // camera class 
// class StereoImageAcq{
//     // private:
//     // Variables for Current Pose
//     int height;
//     int width;
//     std::string encoding;
//     uint8_t is_bigendian;
//     uint32_t step;
//     std::vector<uint8_t> left_image;
//     // uint8_t* left_image; 
//     std::vector<uint8_t> right_image;

//     // ROS
//     ros::NodeHandle nh; // Create its specific node handler

//     image_transport::ImageTransport it(ros::NodeHandle nh);

//     ros::Publisher left_imagePublisher;
//     ros::Publisher right_imagePublisher; 
//     ros::Subscriber left_imageSubscriber;
//     ros::Subscriber right_imageSubscriber;

//     public:
//     // Constructor
//     StereoImageAcq() {
//         int my_size = 1;
    
//         this->left_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/left_image", my_size);
//         this->right_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/right_image", my_size);
//         // this->left_imageSubscriber = n.subscribe("/imagePublisher/left_image", my_size, &StereoImageAcq::imageCallbackL, this);
//         image_transport::Subscriber subL = it.subscribe("/imagePublisher/left_image", 1, &StereoImageAcq::imageCallbackL);
//         this->height = 1200; 
//         this->width = 1920; 
//     }

//     void publish_left_image() {
//         sensor_msgs::Image left_img_msg;
//         left_img_msg.data = this->left_image;

//         // for (int i = 0; i < 1024; i++) {
//         //     (left_img_msg.data).push_back((this->left_image)[i]);
//         // }
        
//         left_img_msg.height = this->height; 

//         this->left_imagePublisher.publish(left_img_msg);
//     }

//     void publish_right_image() {
//         sensor_msgs::Image right_img_msg;
//         right_img_msg.data = this->right_image;
//         right_img_msg.height = this->height; 

//         this->right_imagePublisher.publish(right_img_msg);
//     }

//     // void leftImageCallBack(const sensor_msgs::Image::ConstPtr& msg)
//     // {
//     //     // std::vector<uint8_t> data = msg->data; 

//     //     try
//     //        {
//     //          cv::imshow("view", cv_bridge::toCvShare(msg, "bgr8")->image);
//     //          cv::waitKey(30);
//     //        }
//     //        catch (cv_bridge::Exception& e)
//     //        {
//     //          ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
//     //        }

//     //     // std::cout << ((msg->data)[4]) << std::endl;
        
//     //     // std::cout << msg->height << std::endl;

//     //     // for (int i=0; i<(msg->data).size(); i++)
//     //     //     (this->data).push_back((msg->data)[i]);
//     //     // this->data = msg->data;
//     //     // uint8_t* buffer1 = (uint8_t*) &((msg->data).front());

//     //     // cv::Mat inMat = cv::Mat(this->height, this->width, CV_8UC3, buffer1);
//     //     // cv::Mat dst;
//     //     // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
//     //     // // cv::imshow("Left camera", dst);
//     //     // // cv::waitKey(100);

//     //     // char image_name2[256];
//     //     // std::sprintf(image_name2,"subscriber%04d_L.png", imageCount);
//     //     // cv::imwrite(image_name2, dst);
//     //     // imageCount = imageCount + 1;
//     // }

//     void set_left_image(uint8_t*  buffer1) {
//         int N = 1024;
//         // std::vector<uint8_t> temp(&buffer1[0], &buffer1[N]);

//         // std::vector<uint8_t> temp; 
//         // uint8_t temp[8];
//         // uint8_t* temp2;
//         uint8_t *temp;
//         temp = (uint8_t*) malloc(N*sizeof(uint8_t));
//         temp = buffer1; 

//         for (int i=0; i<N; i++) {
//             // temp.push_back(buffer1[i]);

//             // temp[i] = buffer1[i];

//             (this->left_image).push_back(buffer1[i]);
//             // std::cout << buffer1[i] << std::endl;
//             // std::cout << temp[i] << std::endl;
//         }

//         // this->left_image = buffer1; 


//         // temp2 = temp; 


//         // this->is_bigendian = *buffer1; 

//         // std::cout << (&buffer1[4]) << std::endl;

//         // THIS DOESN'T WORK!!!! 
//         // uint8_t* buffer2 = (uint8_t*)&(this->left_image); // &((this->left_image).front()); 

//         // // uint8_t* buffer2 = (uint8_t*) & (buffer1[0]); 
//         // cv::Mat inMat = cv::Mat(this->height, this->width, CV_8UC3, buffer2);
//         // cv::Mat dst;
//         // cv::cvtColor(inMat, dst, cv::COLOR_BGR2RGB); 
//         // char image_name2[256];
//         // std::sprintf(image_name2,"CameraLeft%04d_L.png", imageCount);
//         // cv::imwrite(image_name2, dst);
//         // imageCount = imageCount + 1;

//         free(temp);
//     }

//     void set_right_image(uint8_t*  buffer2) {
//         int N = 1024;
//         // std::vector<uint8_t> temp(&buffer2[0], &buffer2[N]);
//         for (int i=0; i< N; i++)
//         this->right_image.push_back(buffer2[i]);
//     }

//     // ********************************************************************************************************
//     // 3 functions to essentially allocate the GlobalFrames structure with data from the given image 
//     void imageCallback(const sensor_msgs::ImageConstPtr& msg, bool left) {
//         try
//         {
//             if (left) {
//                 globalFrames.lFrame = cv_bridge::toCvShare(msg, "bgr8")->image.clone();
//                 globalFrames.frameFlag |= 0b01;
//             }
//             else {
//                 globalFrames.rFrame = cv_bridge::toCvShare(msg, "bgr8")->image.clone();
//                 globalFrames.frameFlag |= 0b10;
//             }
//         }
//         catch (cv_bridge::Exception& e)
//         {
//             ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
//         }
//     }

//     void imageCallbackL(const sensor_msgs::ImageConstPtr& msg) {
//         imageCallback(msg, true);
//     }

//     void imageCallbackR(const sensor_msgs::ImageConstPtr& msg) {
//         imageCallback(msg, false);
//     }
// };

   // ********************************************************************************************************
    // 3 functions to essentially allocate the GlobalFrames structure with data from the given image 
    void imageCallback(const sensor_msgs::ImageConstPtr& msg, bool left) {
        try
        {
            if (left) {
                // globalFrames.lFrame = cv_bridge::toCvShare(msg, "bgr8")->image.clone();

                cv_bridge:: bridge = cv_bridge::Cv_bridge();
                globalFrames.lFrame = cv_bridge::bridge.imgmsg_to_cv2(msg, desired_encoding='rgb8');

                globalFrames.frameFlag |= 0b01;

                cv::imshow("Matches", globalFrames.lFrame);
                cv::waitKey(100);
            }
            else {
                // globalFrames.rFrame = cv_bridge::toCvShare(msg, "bgr8")->image.clone();

                cv_bridge:: = Cv_bridge();
                globalFrames.rFrame = cv_bridge::bridge.imgmsg_to_cv2(msg, desired_encoding='rgb8');

                globalFrames.frameFlag |= 0b10;
            }
        }
        catch (cv_bridge::Exception& e)
        {
            ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
        }
    }

    void imageCallbackL(const sensor_msgs::ImageConstPtr& msg) {
        imageCallback(msg, true);
    }

    void imageCallbackR(const sensor_msgs::ImageConstPtr& msg) {
        imageCallback(msg, false);
    }

int main(int argc, char** argv) {

    // Initialize ROS node
    ros::init(argc, argv, "Stereo_Images_Acquisition");

    //Initialize Turtle Object
    // StereoImageAcq stereo_image_acq = StereoImageAcq();


    ros::NodeHandle nh;

    // auto markersPub = nh.advertise<visualization_msgs::MarkerArray>("/mur/cones/stereo/markers", 1);

    image_transport::ImageTransport it(nh);

    // image_transport::Subscriber subL = it.subscribe("mur/stereo_cam/left_image", 1, imageCallbackL);
    // image_transport::Subscriber subR = it.subscribe("mur/stereo_cam/right_image", 1, imageCallbackR);

    image_transport::Subscriber subL = it.subscribe("/imagePublisher/left_image", 1, imageCallbackL);

    // image_transport::Subscriber subL = it.subscribe("/stereo_cam/left/image_raw", 1, imageCallbackL);
    // image_transport::Subscriber subR = it.subscribe("/stereo_cam/right/image_raw", 1, imageCallbackR);

    // ros::Publisher coneEstPub = nh.advertise<mur_common::cone_msg>("/mur/cones/stereo", 1);

    ros::Publisher left_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/left_image", 1);
    ros::Publisher right_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/right_image", 1);

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

    std::vector<uint8_t> left_image;
    // uint8_t* left_image; 
    std::vector<uint8_t> right_image;

                sensor_msgs::Image right_img_msg;
                sensor_msgs::Image left_img_msg;

    
    int exitCode = 0;

    imageCount = 0;

    // std::cout << "initialising library" << std::endl;

    try {
        camera1->setup(CAMARA_NAME_L);
        camera2->setup(CAMARA_NAME_R);

        // std::cout << "entered try block" << std::endl;

        camera1->startGrabbing(grabCount);
        camera2->startGrabbing(grabCount);

        
        auto first_camera1 = std::chrono::high_resolution_clock::now();
        auto first_camera2 = first_camera1;
        
        bool flag = true;

        while(ros::ok()) { // while ros is running, repeat this 
            ros::spinOnce();
            // if (globalFrames.frameFlag == 0b11) {

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

                        // stereo_image_acq.set_left_image(buffer1);

                        //   int N = 1024;
                        //     for (int i=0; i< N; i++)
                        //         left_image.push_back(buffer1[i]);

                           for (int i=0; i< 1024; i++)
                        (left_img_msg.data).push_back(buffer1[i]); // left_image[i]);

                        cv::Mat inMat = cv::Mat(height1, width1, CV_8UC3, buffer1);

                        bridge = cv_bridge::CvBridge();
                        image_message = bridge.cv2_to_imgmsg(inMat, encoding="rgb8");

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
                            // stereo_image_acq.set_right_image(buffer2);

                            // int N = 1024;
                            // for (int i=0; i< N; i++)
                            //     right_image.push_back(buffer2[i]);


                            for (int i=0; i<1024; i++)
                                (right_img_msg.data).push_back(buffer2[i]); // right_image[i]);


                            cv::Mat inMat2 = cv::Mat(height2, width2, CV_8UC3, buffer2);
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
                    // stereo_image_acq.publish_left_image();
                    // stereo_image_acq.publish_right_image();                

         


                    // right_img_msg.data = right_image;
                    

                    right_imagePublisher.publish(right_img_msg);

                     
                    // left_img_msg.data = left_image;

                 

                    left_imagePublisher.publish(left_img_msg);

                }
                // ros::spinOnce();
            //   globalFrames.frameFlag = 0b00;
            // }
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
    // camera2->finalizeLibrary();

    delete camera1.release();
    // delete camera2.release();

    return exitCode;
}