#include "Detectors.hpp"
#include "StereoBench.hpp"

/*
This is a class, "Detector" that detects objects in a frame


*/

// empty constructor
Detectors::Detectors() {

}

// a constructor 
Detectors::~Detectors() {
    delete detNN.release();
    delete keypointDetector.release();
}

// an initialization method for the class, "Detector" 
void Detectors::initialize(std::string objectModel, std::string featureModel) {

    // reset the 
    detNN.reset(new tk::dnn::Yolo3Detection());
    detNN->init(objectModel, n_classes, n_batch);

    std::string trtPath = featureModel.replace(featureModel.end() - 4,
                                               featureModel.end(), "trt");

    keypointDetector.reset(
    new KeypointDetector(
        featureModel,
        trtPath, 
        keypointsW, 
        keypointsH, 
        maxBatch)
    );
}

// detects a frame given the image frame, a vector of the cone's region of interests, and previewArgs 
// it'll detect all the objects in the image frame and store these in coneROIs 
void Detectors::detectFrame(const cv::Mat &imageFrame, std::vector<ConeROI> &coneROIs, const PreviewArgs& previewArgs) {

    // ? 
    std::vector<cv::Mat> batch_frame;
    std::vector<cv::Mat> batch_dnn_input;

    // batch frame will be used for image output
    if (previewArgs.valid) {
        *(previewArgs.lFrameBBoxMatPtr) = imageFrame.clone();
        batch_frame.push_back(*(previewArgs.lFrameBBoxMatPtr));
    }

    // dnn input will be resized to network format
    // The DNN input size is resized to the size of the input image 
    batch_dnn_input.push_back(imageFrame.clone());

    // network inference 
    // detNN is a parameter in the "Detector" class 
    detNN->update(batch_dnn_input, n_batch);

    std::vector<tk::dnn::box> bboxs = detNN->batchDetected[0];
    
    StereoBenchAddTime(SB_TIME_IDX::FRAME_DETECT);

    // generate a vector of image crops for keypoint detector
    std::vector<cv::Mat> rois;

    for (const auto &bbox: bboxs)
    {
        ConeROI coneROI;

        int left    = std::max<float>(float(bbox.x), 0.0f);
        int right   = std::min<float>(float(bbox.x + bbox.w), (float) imageFrame.cols);
        int top     = std::max<float>(float(bbox.y), 0.0f);
        int bot     = std::min<float>(float(bbox.y + bbox.h), (float) imageFrame.rows);

        cv::Rect box(cv::Point(left, top), cv::Point(right, bot));
        cv::Mat roi = imageFrame(box);
        rois.push_back(roi);

        coneROI.roiRect = box;
        coneROI.x = bbox.x;
        coneROI.y = bbox.y;
        coneROI.w = bbox.w;
        coneROI.h = bbox.h;

        coneROIs.push_back(coneROI);
    }

    // keypoint network inference
    std::vector<std::vector<cv::Point2f>> keypoints = keypointDetector->doInference(rois);

    StereoBenchAddTime(SB_TIME_IDX::FRAME_KEYPT);

    if (previewArgs.valid) {
        detNN->draw(batch_frame);
    }
    for (int i = 0; i < bboxs.size(); i++) {
        for (int j = 0; j < keypoints[i].size(); j++) {
            cv::Point2f &keypoint = keypoints[i][j];
            keypoint.y += bboxs[i].y;
            keypoint.x += bboxs[i].x;

            if (previewArgs.valid) {
                cv::circle(batch_frame[0], keypoint, 3, cv::Scalar(0, 255, 0), -1, 8);
            }

            coneROIs[i].keypoints.push_back(keypoint);
            coneROIs[i].colorID = static_cast<ConeColorID>(bboxs[i].cl);
        }
    }

    std::cout << " " << std::setw(5) << detNN->batchDetected[0].size() << " objects detected.";
    std::cout << std::endl;
}