#include <iostream>

#include <opencv2/core.hpp>

using namespace cv;

int main(int argc, char** argv) {

    // read images 

    // find checkerboard corners 
    // int flags = CALIB_CB_ADAPTIVE_THRESH + CALIB_CB_NORMALIZE_IMAGE
    bool findChessboardCorners(InputArray image, Size patternSize, OutputArray corners, int flags = 0);

    // refine checkerboard corners 
    void cornerSubPix(InputArray image, InputOutputArray corners, Size winSize, Size zeroZone, TermCriteria criteria);

    // calibrate cameras
    double calibrateCamera(InputArrayOfArrays objectPoints, InputArrayOfArrays imagePoints, Size imageSize, 
    InputOutputArray cameraMatrix, InputOutputArray distCoeffs, OutputArrayOfArrays rvecs, OutputArrayOfArrays tvecs); 

    return 0;
}