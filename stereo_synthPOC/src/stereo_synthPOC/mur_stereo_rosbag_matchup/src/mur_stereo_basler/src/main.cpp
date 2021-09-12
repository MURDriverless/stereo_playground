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

#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <sensor_msgs/Image.h>

using namespace sensor_msgs;
using namespace message_filters;

#define PREVIEW

#ifndef SRC_ROOT_PATH
#define SRC_ROOT_PATH "./"
#endif

static const std::string OPENCV_WINDOW = "right Image Window";

// class ImageConverter {
//   ros::NodeHandle nh_;
//   image_transport::ImageTransport it_;
//   image_transport::Subscriber image_sub_;
//   image_transport::Publisher image_pub_;

// public:
//   ImageConverter():it_(nh_) {
//     // Subscrive to input video feed and publish output video feed
//     image_sub_ = it_.subscribe("/imagePublisher/right_image", 1,
//     &ImageConverter::imageCb, this);
//     image_pub_ = it_.advertise("/imagePublisher/right_image", 1);

//     cv::namedWindow(OPENCV_WINDOW);
//   }

//   ~ImageConverter() {
//     cv::destroyWindow(OPENCV_WINDOW);
//   }

//     // this imageCB function is used to convert ROS messages to OpenCV messages 
//   void imageCb(const sensor_msgs::ImageConstPtr& msg) {
//     cv_bridge::CvImagePtr cv_ptr;
    
//     try {
//       cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
//     }
//     catch (cv_bridge::Exception& e) {
//       ROS_ERROR("cv_bridge exception: %s", e.what());
//       return;
//     }

//     cv::Mat left_dst;
//     cv::cvtColor(cv_ptr->image, left_dst, cv::COLOR_BGR2RGB); 
    
//     // Update GUI Window
//     // cv::imshow(OPENCV_WINDOW, left_dst);
//     // cv::waitKey(100);

//     char image_name[256];
//     std::sprintf(image_name,"Cameraright%04d_L.png", std::stoi(cv_ptr->header.frame_id));
//     cv::imwrite(image_name, left_dst);

//     std::cout << "Time stamp is: " << cv_ptr->header.stamp << std::endl;
//     std::cout << "frame id is: " << cv_ptr->header.frame_id << std::endl; 

//   }
// };

void callback(const ImageConstPtr& image1, const ImageConstPtr& image2)
{
  cv_bridge::CvImagePtr cv_ptr_left;
  cv_bridge::CvImagePtr cv_ptr_right;
    
    try {
      cv_ptr_left = cv_bridge::toCvCopy(image1, sensor_msgs::image_encodings::BGR8);
      cv_ptr_right = cv_bridge::toCvCopy(image2, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e) {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    cv::Mat left_dst;
    cv::Mat right_dst;
    cv::cvtColor(cv_ptr_left->image, left_dst, cv::COLOR_BGR2RGB); 
    cv::cvtColor(cv_ptr_right->image, right_dst, cv::COLOR_BGR2RGB); 

    char image_name_left[256];
    std::sprintf(image_name_left,"/mnt/SSD/CameraLeft%04d_L.png", std::stoi(cv_ptr_left->header.frame_id));
    cv::imwrite(image_name_left, left_dst);

    std::cout << "Time stamp (Left) is: " << cv_ptr_left->header.stamp.toSec() << std::endl;
    std::cout << "frame id (Left) is: " << cv_ptr_left->header.frame_id << std::endl; 

    char image_name_right[256];
    std::sprintf(image_name_right,"/mnt/SSD/CameraRight%04d_R.png", std::stoi(cv_ptr_right->header.frame_id));
    cv::imwrite(image_name_right, right_dst);

    std::cout << "Time stamp (Right) is: " << cv_ptr_right->header.stamp.toSec() << std::endl;
    std::cout << "frame id (Right) is: " << cv_ptr_right->header.frame_id << std::endl; 

}

int main(int argc, char** argv) {
    ros::init(argc, argv, "right_Image_rosbag_read");
    // ImageConverter ic; 

    ros::NodeHandle nh;
    message_filters::Subscriber<Image> image1_sub(nh, "/imagePublisher/left_image", 1);
    message_filters::Subscriber<Image> image2_sub(nh, "/imagePublisher/right_image", 1);

    typedef sync_policies::ApproximateTime<Image, Image> MySyncPolicy;
    // ApproximateTime takes a queue size as its constructor argument, hence MySyncPolicy(10)
    Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), image1_sub, image2_sub);
    sync.registerCallback(boost::bind(&callback, _1, _2));

    ros::spin();

    int exitCode = 0;
    return exitCode;
}

