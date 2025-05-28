# 🎓 Image Classification Train Classifier

This Python application trains a Custom Vision model for fruit classification using Azure Cognitive Services Custom Vision API.

## 📋 What This Code Does

The `train-classifier.py` script:
- 🔗 **Connects** to Azure Custom Vision training service
- 🏗️ **Creates a new project** (if it doesn't exist)
- 🏷️ **Creates tags** for different fruit categories (apple, banana, orange)
- 📤 **Uploads training images** with appropriate tags
- 🎯 **Trains the model** using uploaded images
- ⏳ **Monitors training progress** and waits for completion
- 📊 **Displays training results** and performance metrics

## 🚀 Setup Instructions

### Step 1: Navigate to Project Directory
```bash
cd /workspaces/mslearn-ai-vision/Labfiles/image-classification/python/train-classifier
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

1. 📝 Edit the `.env` file with your Custom Vision training credentials:
```env
TrainingEndpoint=YOUR_TRAINING_ENDPOINT  # from gear icon in Custom Vision portal
TrainingKey=YOUR_TRAINING_KEY            # from gear icon in Custom Vision portal
ProjectID=YOUR_PROJECT_ID                # from gear icon in Custom Vision portal (optional for new projects)
```

2. 🔧 To get these values:
   - Go to [Custom Vision portal](https://www.customvision.ai)
   - Create a new resource or use existing one
   - Click the ⚙️ gear icon (Settings)
   - Copy the training endpoint and key

## 📁 Training Images Structure

Organize your training images in the following structure:
```
training-images/
├── apple/
│   ├── apple1.jpg
│   ├── apple2.jpg
│   └── ...
├── banana/
│   ├── banana1.jpg
│   ├── banana2.jpg
│   └── ...
└── orange/
    ├── orange1.jpg
    ├── orange2.jpg
    └── ...
```

💡 **Tip**: You can also use the `more-training-images/` folder for additional training data!

## 🏃‍♂️ Running the Training

```bash
python train-classifier.py
```

## 🎯 Training Process

The script will:
1. 🔍 **Check** for existing project or create new one
2. 🏷️ **Create tags** for each fruit category
3. 📤 **Upload images** in batches with appropriate tags
4. 🎯 **Start training** the model
5. ⏳ **Wait** for training completion (may take several minutes)
6. 📊 **Display** training results and performance metrics

## 📊 Expected Output

```
Creating project...
Creating tags...
Adding images...
Training...
Training status: Training
Training status: Training
Training completed!

Precision: 95.2%
Recall: 93.8%
AP (Average Precision): 94.5%
```

## 📤 Next Steps

After successful training:
1. 🌐 Go to [Custom Vision portal](https://www.customvision.ai)
2. 📊 Review performance metrics in the "Performance" tab
3. 📤 **Publish your model** for testing:
   - Click "Publish"
   - Enter model name (e.g., "fruit-classifier")
   - Select prediction resource
4. 🔍 Use the published model with the test-classifier

## 🔧 Dependencies

- `azure-cognitiveservices-vision-customvision` - Azure Custom Vision SDK
- `dotenv` - Environment variable management

## 📋 Requirements

- ✅ Python 3.6+
- ✅ Azure Custom Vision account
- ✅ Training images organized by category
- ✅ Valid training credentials

## 💡 Tips for Better Training

- 📸 Use **15-30 images** per category minimum
- 🔄 Include **varied angles, lighting, and backgrounds**
- 🎯 Ensure **good image quality** and clear subjects
- 🏷️ **Consistent tagging** across similar images
