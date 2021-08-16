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

unsigned int grabCount = 20;
int imageCount = 0;

static const std::string OPENCV_WINDOW = "right Image Window";

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

    cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter() {
    cv::destroyWindow(OPENCV_WINDOW);
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

    cv::Mat dst;
    cv::cvtColor(cv_ptr->image, dst, cv::COLOR_BGR2RGB); 
    
    // Update GUI Window
    // cv::imshow(OPENCV_WINDOW, dst);
    // cv::waitKey(100);

    char image_name[256];
    std::sprintf(image_name,"Cameraright%04d_L.png", std::stoi(cv_ptr->header.frame_id));
    cv::imwrite(image_name, dst);

    std::cout << "Time stamp is: " << cv_ptr->header.stamp << std::endl;
    std::cout << "frame id is: " << cv_ptr->header.frame_id << std::endl; 

  }
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "right_Image_rosbag_read");
    ImageConverter ic; 
    ros::spin();

    int exitCode = 0;
    return exitCode;
}