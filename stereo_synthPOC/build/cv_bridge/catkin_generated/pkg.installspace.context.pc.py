# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/local/include/opencv4".split(';') if "${prefix}/include;/usr/local/include/opencv4" != "" else []
PROJECT_CATKIN_DEPENDS = "rosconsole;sensor_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lcv_bridge;/usr/local/lib/libopencv_core.so.4.1.1;/usr/local/lib/libopencv_imgproc.so.4.1.1;/usr/local/lib/libopencv_imgcodecs.so.4.1.1".split(';') if "-lcv_bridge;/usr/local/lib/libopencv_core.so.4.1.1;/usr/local/lib/libopencv_imgproc.so.4.1.1;/usr/local/lib/libopencv_imgcodecs.so.4.1.1" != "" else []
PROJECT_NAME = "cv_bridge"
PROJECT_SPACE_DIR = "/workspace/stereo_playground/stereo_synthPOC/install"
PROJECT_VERSION = "1.13.0"
