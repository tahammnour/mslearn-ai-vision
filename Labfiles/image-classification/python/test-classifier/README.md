# 🔍 Image Classification Test Classifier

This Python application tests a published Custom Vision model to classify fruit images using Azure Cognitive Services Custom Vision API.

## 📋 What This Code Does

The `test-classifier.py` script:
- 🔐 **Authenticates** with Azure Custom Vision using your prediction key
- 📁 **Loads test images** from the `test-images` folder
- 🤖 **Classifies each image** using your published Custom Vision model
- 📊 **Displays predictions** with confidence scores above 50%
- 🏷️ **Shows results** in format: `image_name : tag_name (confidence%)`

## 🚀 Setup Instructions

### Step 1: Navigate to Project Directory
```bash
cd /workspaces/mslearn-ai-vision/Labfiles/image-classification/python/test-classifier
```

### Step 2: Create Virtual Environment
```bash
python -m venv labenv
```

### Step 3: Activate Virtual Environment
```bash
# On Linux/macOS
source labenv/bin/activate

# On Windows
labenv\Scripts\activate
```

### Step 4: Install Dependencies
```bash
pip install -r requirements.txt
```

## ⚙️ Configuration

⚠️ **Important**: Before running the test classifier, you need a **published model** in Custom Vision!

1. 📝 Edit the `.env` file with your Custom Vision credentials:
```env
PredictionEndpoint=YOUR_PREDICTION_ENDPOINT  # from gear icon in Custom Vision portal
PredictionKey=YOUR_PREDICTION_KEY            # from gear icon in Custom Vision portal  
ProjectID=YOUR_PROJECT_ID                    # from gear icon in Custom Vision portal
ModelName=fruit-classifier                   # model name after publishing
```

2. 🔧 To get these values:
   - Go to [Custom Vision portal](https://www.customvision.ai)
   - Open your project
   - Click the ⚙️ gear icon (Settings)
   - Copy the required values

3. 📤 **Publish your model** in Custom Vision:
   - Go to the "Performance" tab
   - Click "Publish"
   - Enter model name (e.g., "fruit-classifier")
   - Select prediction resource

## 🏃‍♂️ Running the Application

```bash
python test-classifier.py
```

## 📸 Test Images

Place your test images in the `test-images/` folder. The script will automatically process all images in this directory.

## 🎯 Expected Output

```
IMG_TEST_1.jpg : apple (85%)
IMG_TEST_2.jpg : orange (92%)
IMG_TEST_3.jpg : banana (78%)
```

## 🔧 Dependencies

- `azure-cognitiveservices-vision-customvision` - Azure Custom Vision SDK
- `dotenv` - Environment variable management

## 📋 Requirements

- ✅ Python 3.6+
- ✅ Azure Custom Vision account
- ✅ Published Custom Vision model
- ✅ Valid prediction credentials
