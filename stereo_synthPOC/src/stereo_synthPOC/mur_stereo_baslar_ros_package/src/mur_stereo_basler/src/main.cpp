#include <ros/duration.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>

#include <sensor_msgs/image_encodings.h>

#include <opencv2/highgui.hpp>
#include <opencv2/calib3d.hpp>

#include <opencv2/core/cuda.hpp>
#include <opencv2/cudawarping.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudaimgproc.hpp>

#include <opencv2/xfeatures2d.hpp>
#include <opencv2/xfeatures2d/nonfree.hpp>
#include <iostream>

#include <ros/ros.h> // Must include for all ROS C++
#include "sensor_msgs/Image.h" 
#include <sstream>
#include <opencv2/core.hpp>

#include <opencv2/imgproc.hpp>

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

// namespace cv_bridge {

// class CvImage
// {
// public:
//   std_msgs::Header header;
//   std::string encoding;
//   cv::Mat image;
// };

// typedef boost::shared_ptr<CvImage> CvImagePtr;
// typedef boost::shared_ptr<CvImage const> CvImageConstPtr;

//   sensor_msgs::ImagePtr toImageMsg() const;

//   // Overload mainly intended for aggregate messages that contain
//   // a sensor_msgs::Image as a member.
//   void toImageMsg(sensor_msgs::Image& ros_image) const;

// }

static const std::string OPENCV_WINDOW = "Image window";

class ImageConverter
{
  ros::NodeHandle nh_;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;

public:
  ImageConverter()
    : it_(nh_)
  {
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/imagePublisher/left_image", 1,
    &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/imagePublisher/left_image", 1);

    cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(OPENCV_WINDOW);
  }

    // this imageCB function is used to convert ROS messages to OpenCV messages 
  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
      // std::cout << "error 1" << std::endl;
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
      // std::cout << "error 2" << std::endl; 
    }
    catch (cv_bridge::Exception& e)
    {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    cv::Mat dst;
    cv::cvtColor(cv_ptr->image, dst, cv::COLOR_BGR2RGB); 
    
    // Update GUI Window
    cv::imshow(OPENCV_WINDOW, dst);
    cv::waitKey(100);
  }
};

// void imageCallback(const sensor_msgs::ImageConstPtr& msg, bool left) {
//     try
//     {
//         if (left) {
//             // globalFrames.lFrame = cv_bridge::toCvShare(msg, "bgr8")->image.clone();

//             // cv_bridge:: bridge = cv_bridge::Cv_bridge();
//             globalFrames.lFrame = cv_bridge::bridge.imgmsg_to_cv2(msg, desired_encoding='rgb8');
//             globalFrames.frameFlag |= 0b01;
//             cv::imshow("Matches", globalFrames.lFrame);
//             cv::waitKey(100);
//         }
//         else {
//             // globalFrames.rFrame = cv_bridge::toCvShare(msg, "bgr8")->image.clone();

//             cv_bridge:: = Cv_bridge();
//             globalFrames.rFrame = cv_bridge::bridge.imgmsg_to_cv2(msg, desired_encoding='rgb8');

//             globalFrames.frameFlag |= 0b10;
//         }
//     }
//     catch (cv_bridge::Exception& e)
//     {
//         ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
//     }
// }

// void imageCallbackL(const sensor_msgs::ImageConstPtr& msg) {
//     imageCallback(msg, true);
// }

// void imageCallbackR(const sensor_msgs::ImageConstPtr& msg) {
//     imageCallback(msg, false);
// }

int main(int argc, char** argv) {
    ros::init(argc, argv, "Stereo_Images_Acquisition");
    ros::NodeHandle nh;
    image_transport::ImageTransport it(nh);

    // image_transport::Subscriber subL = it.subscribe("/imagePublisher/left_image", 1, imageCallbackL);

    ros::Publisher left_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/left_image", 1);
    // ros::Publisher right_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/right_image", 1);

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
    std::vector<uint8_t> right_image;

    ImageConverter ic; 
    
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

        while(ros::ok()) { 
            ros::spinOnce();

                while (imageCount < grabCount && camera1->isGrabbing()) {
                    // Wait for an image and then retrieve it. A timeout of 5000 ms is used.

                    // std::cout << "entered while loop" << std::endl;
                    int height1;
                    int width1;
                    uint8_t* buffer1;

                    int height2;
                    int width2;
                    uint8_t* buffer2;

                    bool ret1 = camera1->retreiveResult(height1, width1, buffer1);
                    bool ret2 = camera2->retreiveResult(height2, width2, buffer2);

                    cv::Mat dst2;
                    sensor_msgs::Image right_img_msg;
                    sensor_msgs::Image left_img_msg;
                    

                    if (ret1) {

                        // cv::Mat inMat = cv::Mat(height1, width1, CV_8UC3, buffer1);

                        cv_bridge::CvImage myCvImage; 

                        // put the image into a CvImage object 
                        myCvImage.image = cv::Mat(height1, width1, CV_8UC3, buffer1);
                        myCvImage.encoding = "bgr8";

                  

                        // convert the CvImage object into a ROS image 
                        myCvImage.toImageMsg(left_img_msg);

                        
                        // image_message = bridge.cv2_to_imgmsg(inMat, encoding="rgb8");

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

                    // while (camera2 -> isGrabbing()) {
                    //     if (ret2) {

                    //         cv::Mat inMat2 = cv::Mat(height2, width2, CV_8UC3, buffer2);
                    //         // cv::cvtColor(inMat2, dst2, cv::COLOR_BGR2RGB); 
                            
                    //         // cv::imshow("Right camera", dst2);
                    //         // cv::resizeWindow("Right camera", 800, 600);
                    //         // cv::waitKey(100);

                    //         // std::snprintf(pathBuf, 256, "%s/Image%04d_L.png", imFolder, frameNum);
                    //         // char image_name2[256];
                    //         // std::sprintf(image_name2,"CameraRight%04d_R.png", imageCount);
                    //         // cv::imwrite(image_name2, dst2);
                    //     }
                    //     break;
                    // }
                    auto camera2_done = std::chrono::high_resolution_clock::now();

                    double frameTime1 = std::chrono::duration_cast<std::chrono::milliseconds>(camera1_done - first_camera1).count();
                    double frameTime2 = std::chrono::duration_cast<std::chrono::milliseconds>(camera2_done - first_camera2).count();

                    std::cout << "camera 1 time is: " << frameTime1 << ", " << "camera 2 time is: " << frameTime2 << std::endl;

                    first_camera1 = camera1_done; 
                    first_camera2 = camera2_done;

                    imageCount++;


                    // right_imagePublisher.publish(right_img_msg);
                    left_imagePublisher.publish(left_img_msg);
                    
                    // need to publish here! 
                    
                    // Output modified video stream
                    // image_pub_.publish(cv_ptr->toImageMsg());
                }
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