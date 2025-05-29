# 🔍 Object Detection with Azure Custom Vision

This project contains Python scripts for training and testing custom object detection models using Azure Custom Vision Service.

## 📁 Project Structure

```
python/
├── 📂 test-detector/          # Testing object detection models
│   ├── test-detector.py       # Main testing script
│   ├── requirements.txt       # Dependencies for testing
│   ├── .env                   # Environment variables
│   ├── produce.jpg            # Sample test image
│   └── output.jpg             # Generated output with detections
├── 📂 train-detector/         # Training object detection models
│   ├── add-tagged-images.py   # Script to upload tagged training images
│   ├── requirements.txt       # Dependencies for training
│   ├── .env                   # Environment variables
│   ├── tagged-images.json     # JSON file with image tags and regions
│   └── 📂 images/             # Training images folder
└── README.md                  # This file
```

## 🚀 Getting Started

### Step 1: Navigate to Project Directory 📍
```bash
cd /workspaces/mslearn-ai-vision/Labfiles/object-detection/python
```

### Step 2: Create Virtual Environment 🐍
```bash
python -m venv labenv
```

### Step 3: Activate Virtual Environment ⚡
```bash
# On Linux/macOS
source labenv/bin/activate

# On Windows
labenv\Scripts\activate
```

### Step 4: Install Dependencies 📦
Navigate to the specific folder (test-detector or train-detector) and install requirements:

```bash
# For test-detector
cd test-detector
pip install -r requirements.txt

# For train-detector  
cd ../train-detector
pip install -r requirements.txt
```

## 🧪 Test Detector

### 📋 Description
The `test-detector.py` script uses a trained Azure Custom Vision model to detect objects in images. It analyzes the image and draws bounding boxes around detected objects with confidence scores.

### 🔧 Code Functionality
- **Object Detection**: Uses Azure Custom Vision Prediction API to detect objects
- **Visual Annotation**: Draws bounding boxes around detected objects
- **Confidence Filtering**: Only shows detections with >50% confidence
- **Output Generation**: Saves annotated image as `output.jpg`

### 📦 Requirements
```
dotenv
matplotlib
azure-cognitiveservices-vision-customvision
```

### 🏃‍♂️ How to Run
1. Configure your `.env` file with Azure Custom Vision credentials
2. Place test image in the folder (default: `produce.jpg`)
3. Run the script:
```bash
python test-detector.py
```

### 📊 Output
- Console output showing detected object names
- `output.jpg` file with visual annotations

## 🎓 Train Detector

### 📋 Description
The `add-tagged-images.py` script uploads tagged training images to Azure Custom Vision for training object detection models. It reads image metadata from a JSON file and creates training data with bounding box annotations.

### 🔧 Code Functionality
- **Batch Upload**: Uploads multiple tagged images at once
- **Region Mapping**: Maps JSON tag data to Azure Custom Vision regions
- **Tag Management**: Automatically matches tag names with project tags
- **Error Handling**: Checks upload status and reports failures

### 📦 Requirements
```
dotenv
azure-cognitiveservices-vision-customvision
```

### 📝 Tagged Images JSON Format
The `tagged-images.json` file should contain:
```json
{
  "files": [
    {
      "filename": "image1.jpg",
      "tags": [
        {
          "tag": "apple",
          "left": 0.1,
          "top": 0.2,
          "width": 0.3,
          "height": 0.4
        }
      ]
    }
  ]
}
```

### 🏃‍♂️ How to Run
1. Configure your `.env` file with Azure Custom Vision training credentials
2. Place training images in the `images/` folder
3. Update `tagged-images.json` with your image tags and regions
4. Run the script:
```bash
python add-tagged-images.py
```

## ⚙️ Configuration

Both scripts require environment variables in their respective `.env` files:

### For test-detector:
```
PredictionEndpoint=your_prediction_endpoint
PredictionKey=your_prediction_key
ProjectID=your_project_id
ModelName=your_model_name
```

### For train-detector:
```
TrainingEndpoint=your_training_endpoint
TrainingKey=your_training_key
ProjectID=your_project_id
```

## 🔍 Key Features

- **🎯 Accurate Detection**: Uses Azure Custom Vision for high-accuracy object detection
- **📊 Visual Feedback**: Generates annotated images with bounding boxes
- **⚡ Batch Processing**: Efficiently uploads multiple training images
- **🛡️ Error Handling**: Robust error handling and status reporting
- **🎨 Customizable**: Easy to configure for different projects and models

## 🆘 Troubleshooting

- Ensure your Azure Custom Vision service is properly configured
- Check that your API keys and endpoints are correct in the `.env` files
- Verify that training images are in the correct format (JPG/PNG)
- Make sure tagged regions in JSON file have valid coordinates (0-1 range)

## 🎉 Success Indicators

- ✅ Virtual environment activated successfully
- ✅ Dependencies installed without errors
- ✅ Scripts run without exceptions
- ✅ Output images generated with proper annotations
- ✅ Training images uploaded successfully to Azure Custom Vision

Happy detecting! 🎯✨
