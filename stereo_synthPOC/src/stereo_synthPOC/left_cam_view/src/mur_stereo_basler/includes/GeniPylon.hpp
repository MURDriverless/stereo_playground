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
            
            // Pylon::CEnumParameter(nodemap, "BslLightSourcePreset").SetValue("Daylight6500K");

            camera.Width = 1920;
            camera.Height = 1200;
            
            /**
            // Hardware triggering code 
            // Select GPIO line 1
            camera.LineSelector.SetValue(LineSelector_Line1);
            // Set the line mode to Input
            camera.LineMode.SetValue(LineMode_Input);
            
            // Select GPIO line 3
            camera.LineSelector.SetValue(LineSelector_Line3);
            // Set the line mode to Input
            camera.LineMode.SetValue(LineMode_Output);



            // Select and enable the Frame Start trigger
            camera.TriggerSelector.SetValue(TriggerSelector_FrameStart);
            camera.TriggerMode.SetValue(TriggerMode_On);
            camera.TriggerActivation.SetValue(TriggerActivation_RisingEdge);
            // // Select and enable the Acquisition Start trigger
            // camera.TriggerSelector.SetValue(TriggerSelector_AcquisitionStart);
            // camera.TriggerMode.SetValue(TriggerMode_On);
            
            camera.TriggerSource.SetValue(TriggerSource_Line1);
            **/

            /** 
            // software triggering code 
            // Select the Frame Start trigger
            // camera.TriggerSelector.SetValue(Basler_UniversalCameraParams::TriggerSelector_FrameStart);
            // // Enable triggered image acquisition for the Frame Start trigger
            // camera.TriggerMode.SetValue(Basler_UniversalCameraParams::TriggerMode_On);
            // // Set the trigger source for the Frame Start trigger to Software
            // camera.TriggerSource.SetValue(Basler_UniversalCameraParams::TriggerSource_Software);
            **/

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

        bool isReady() {
            return camera.WaitForFrameTriggerReady(100, Pylon::TimeoutHandling_ThrowException);
        }

        double getFrameRate() {
            return camera.ResultingFrameRate.GetValue();
        }

        void softwareTrigger() {
            // Generate a software trigger signal
            // camera.Open();
            // camera.TriggerSoftware.Execute();
            // camera.Close();
            camera.ExecuteSoftwareTrigger();
            // GenApi::INodeMap& nodemap = camera.GetNodeMap();
            // Pylon::CEnumParameter(nodemap, "PixelFormat").SetValue("RGB8");
            // GenApi genapi_camera; 
            // genapi_camera.Execute();
        }

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