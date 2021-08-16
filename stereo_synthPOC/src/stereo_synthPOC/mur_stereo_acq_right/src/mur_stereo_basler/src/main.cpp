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

const std::string CAMARA_NAME_R = "CameraRight (40061679)";

unsigned int grabCount = 6000;

static const std::string OPENCV_WINDOW = "Right Image Window";

class ImageConverter {
  ros::NodeHandle nh_;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;

public:
  ImageConverter():it_(nh_) {
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/imagePublisher/right_image", 1,
    &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/imagePublisher/right_image", 1);

    // cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter() {
    // cv::destroyWindow(OPENCV_WINDOW);
  }

    // this imageCB function is used to convert ROS messages to OpenCV messages 
  void imageCb(const sensor_msgs::ImageConstPtr& msg) {
    cv_bridge::CvImagePtr cv_ptr;
    
    try {
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e) {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    // cv::Mat dst;
    // cv::cvtColor(cv_ptr->image, dst, cv::COLOR_BGR2RGB); 
    
    // Update GUI Window
    // cv::imshow(OPENCV_WINDOW, dst);
    // cv::waitKey(100);
  }
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "Right_Image_Acquisition");
    ros::NodeHandle nh;
    image_transport::ImageTransport it(nh);

    ros::Publisher right_imagePublisher = nh.advertise<sensor_msgs::Image>("/imagePublisher/right_image", 1);

    // Prep real cameras
    std::unique_ptr<IGeniCam> camera1;

    // run the cameras 
    camera1.reset(IGeniCam::create(GeniImpl::Pylon_i));
    camera1->initializeLibrary();

    ImageConverter ic; 
    
    int exitCode = 0;

    int imageCount = 0;

    try {
        camera1->setup(CAMARA_NAME_R);
        camera1->startGrabbing(grabCount);
        
        auto first_camera1 = std::chrono::high_resolution_clock::now();

        while (imageCount < grabCount && camera1->isGrabbing() && ros::ok()) {
            // Wait for an image and then retrieve it. A timeout of 5000 ms is used.

          int height1;
          int width1;
          uint8_t* buffer1;

          bool ret1 = camera1->retreiveResult(height1, width1, buffer1);

          std::cout << "Camera RightFrame Rate is: " << camera1->getFrameRate() << ", Exposure Time is: " << camera1->getExposureTime(camera1->getNodeMap()) << std::endl;
          
          ros::Time camera1_time = ros::Time::now();

          sensor_msgs::Image right_img_msg;
          

          if (ret1) {
            cv_bridge::CvImage myCvImage; 

            // put the image into a CvImage object 
            myCvImage.image = cv::Mat(height1, width1, CV_8UC3, buffer1);
            myCvImage.encoding = "bgr8";

            myCvImage.header.stamp = camera1_time;
            myCvImage.header.frame_id = std::to_string(imageCount); 

            cv::Mat dst;
            cv::cvtColor(myCvImage.image, dst, cv::COLOR_BGR2RGB); 
            cv::imshow("right image", dst);
            cv::waitKey(100);

            // char image_name[256];
            // std::sprintf(image_name,"CameraRight%04d_R.png", imageCount);
            // cv::imwrite(image_name, dst);

            // convert the CvImage object into a ROS image 
            myCvImage.toImageMsg(right_img_msg);
          }
          auto camera1_done = std::chrono::high_resolution_clock::now();
          double frameTime1 = std::chrono::duration_cast<std::chrono::milliseconds>(camera1_done - first_camera1).count();


          // std::cout << "camera 2 time is: " << frameTime1 << std::endl;

          first_camera1 = camera1_done; 

          imageCount++;

          right_imagePublisher.publish(right_img_msg);

          ros::spinOnce();
  
      }
    }
    catch (const std::exception &e)
    {
        // Error handling.
        std::cerr << "An exception occurred." << std::endl
        << e.what() << std::endl;
        exitCode = 1;
    }

    std::cout << "ending program" << std::endl;
    camera1->finalizeLibrary();

    delete camera1.release();

    return exitCode;
}