/*
related to BaslarDriver. It seems that Andrew took the stuff from BaslarDriver and
made a class from it. 

*/

#pragma once
#include "GeniWrap.hpp"

#include <pylon/PylonIncludes.h>
#include <pylon/BaslerUniversalInstantCamera.h>
#include <pylon/ParameterIncludes.h>
#include <pylon/EnumParameterT.h>
#include <GenApi/GenApi.h>

class PylonCam: public IGeniCam {
    private:
        Pylon::CBaslerUniversalInstantCamera camera;
        Pylon::CGrabResultPtr ptrGrabResult;

    public:
        PylonCam() {

        }
        
        void initializeLibrary() {
            Pylon::PylonInitialize();
        }

        void finalizeLibrary() {
            Pylon::PylonTerminate();
        }

        void setup(const std::string cameraName) {
            Pylon::CTlFactory& TlFactory = Pylon::CTlFactory::GetInstance();
            Pylon::CDeviceInfo di;
            di.SetFriendlyName(cameraName.c_str());
            camera.Attach(TlFactory.CreateDevice(di));

            // Print the model name of the camera.
            std::cout << "Using device " << camera.GetDeviceInfo().GetModelName() << std::endl;

            // The parameter MaxNumBuffer can be used to control the count of buffers
            // allocated for grabbing. The default value of this parameter is 10.
            // camera.MaxNumBuffer = 1;

            camera.Open();
            GenApi::INodeMap& nodemap = camera.GetNodeMap();
            // Pylon::CEnumParameter(nodemap, "PixelFormat").SetValue("BayerBG8");

            // setting the pixelformat removed the 3x3 grid problem when recording images and it allows us to record in colored! 
            Pylon::CEnumParameter(nodemap, "PixelFormat").SetValue("RGB8");
            
            Pylon::CBooleanParameter(nodemap, "AcquisitionFrameRateEnable").SetValue(false);
            // camera.LightSourcePreset.SetValue(Basler_UniversalCameraParams::LightSourcePresetEnums::LightSourcePreset_Daylight6500K);

            camera.Width = 1920;
            camera.Height = 1200;

               // Set the measuring location to core board
            // Pylon::CEnumParameter(nodemap, "DeviceTemperatureSelector").SetValue("Coreboard");
            // Get the current device temperature
            // double d = Pylon::CFloatParameter(nodemap, "DeviceTemperature").GetValue(); 
            // std::cout << "Right camera, coreboard temperature: " << d << std::endl;
        

            // Determine the current exposure time
            // double d = Pylon::CFloatParameter(nodemap, "ExposureTime").GetValue();
            // Set the exposure time mode to Standard
            // CEnumParameter(nodemap, "BslExposureTimeMode").SetValue("Standard");
            // Set the exposure time to 3500 microseconds
            // Pylon::CFloatParameter(nodemap, "ExposureTime").SetValue(10000); // 10ms exposure time 

            
            // // Select auto function ROI 2
            // Pylon::CEnumParameter(nodemap, "AutoFunctionROISelector").SetValue("ROI2");
            // // Enable the Balance White Auto auto function
            // // for the auto function ROI selected
            // Pylon::CBooleanParameter(nodemap, "AutoFunctionROIUseWhiteBalance").SetValue(true);
            // // Enable Balance White Auto by setting the operating mode to Continuous

            // using this one gave an error...
            /*
            The program 'Left camera' received an X Window System error.
            This probably reflects a bug in the program.
            The error was 'BadShmSeg (invalid shared segment parameter)'.
            (Details: serial 213 error_code 128 request_code 130 minor_code 3)
            (Note to programmers: normally, X errors are reported asynchronously;
            that is, you will receive the error a while after causing it.
            To debug your program, run it with the --sync command line
            option to change this behavior. You can then get a meaningful
            backtrace from your debugger if you break on the gdk_x_error() function.)
            */
            // Pylon::CEnumParameter(nodemap, "BalanceWhiteAuto").SetValue("Continuous");
            camera.Close();
        }

        void startGrabbing(uint32_t numImages = UINT32_MAX) {
            // Start the grabbing of c_countOfImagesToGrab images.
            // The camera device is parameterized with a default configuration which
            // sets up free-running continuous acquisition.
            camera.StartGrabbing(numImages, Pylon::GrabStrategy_LatestImageOnly);
        }

        bool isGrabbing() {
            return camera.IsGrabbing();
        }

        double getFrameRate() {
            //   Pylon::CTlFactory& TlFactory = Pylon::CTlFactory::GetInstance();
            // Pylon::CDeviceInfo di;
            // di.SetFriendlyName(cameraName.c_str());
            // camera.Attach(TlFactory.CreateDevice(di));
            // camera.Open();
            // GenApi::INodeMap& nodemap = camera.GetNodeMap();

            // double d = Pylon::CFloatParameter(nodemap, "ExposureTime").GetValue();
            // camera.Close();
            return camera.ResultingFrameRate.GetValue();
            // return d;
        }

        // GenApi::INodeMap& getNodeMap() {
        //     return camera.GetNodeMap();
        // }

        // double getExposureTime(GenApi::INodeMap& nodemap) {
        //     // return Pylon::CFloatParameter(nodemap, "ExposureTime").GetValue();

        //     //   Pylon::CTlFactory& TlFactory = Pylon::CTlFactory::GetInstance();
        //     // Pylon::CDeviceInfo di;
        //     // di.SetFriendlyName(cameraName.c_str());
        //     // camera.Attach(TlFactory.CreateDevice(di));
        //     //camera.Open();
        //     //GenApi::INodeMap& nodemap = camera.GetNodeMap();

        //     double d = Pylon::CFloatParameter(nodemap, "ExposureTime").GetValue();
        //     //camera.Close();
        //     // return camera.ResultingFrameRate.GetValue();
        //     return d;
        // }


        bool retreiveResult(int &height, int &width, uint8_t* &buffer) {
            // Wait for an image and then retrieve it. A timeout of 5000 ms is used.
            camera.RetrieveResult( 5000, ptrGrabResult, Pylon::TimeoutHandling_ThrowException);

            height = ptrGrabResult->GetHeight();
            width  = ptrGrabResult->GetWidth();
            buffer = static_cast<uint8_t *>(ptrGrabResult->GetBuffer());

            return ptrGrabResult->GrabSucceeded();
        }

        void clearResult() {
            return;
        }
};