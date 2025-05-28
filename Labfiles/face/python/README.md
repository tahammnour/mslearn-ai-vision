# 🔍 Azure AI Face Detection Python Application

This Python application demonstrates how to use Azure AI Vision Face service to detect and analyze faces in images. The application identifies faces, extracts facial attributes, and creates annotated images with bounding boxes around detected faces.

## 📋 Prerequisites

- 🐍 Python 3.7 or higher
- ☁️ Azure AI Vision service resource
- 🔧 Git (for cloning the repository)

## 🚀 Setup Instructions

### Step 1: Navigate to Project Directory
```bash
cd /workspaces/mslearn-ai-vision/Labfiles/face/python/face-api
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

### Step 5: Configure Azure Credentials
Edit the `.env` file and add your Azure AI Vision service credentials:
```
AI_SERVICE_ENDPOINT=your_ai_services_endpoint
AI_SERVICE_KEY=your_ai_services_key
```

## 📁 Project Structure

```
face-api/
├── analyze-faces.py      # 🎯 Main application file
├── requirements.txt      # 📦 Python dependencies
├── .env                 # 🔐 Environment variables
├── images/              # 📸 Sample images
│   ├── face1.jpg
│   ├── face2.jpg
│   └── faces.jpg
└── detected_faces.jpg   # 🖼️ Output image with annotations
```

## 🧠 Code Explanation: analyze-faces.py

### 📚 Imports and Dependencies
```python
from dotenv import load_dotenv           # 🔧 Load environment variables
from azure.ai.vision.face import FaceClient  # 🤖 Azure Face API client
from PIL import Image, ImageDraw         # 🎨 Image processing
from matplotlib import pyplot as plt     # 📊 Image visualization
```

### 🔑 Authentication and Configuration
The application loads Azure credentials from the `.env` file:
```python
load_dotenv()
cog_endpoint = os.getenv('AI_SERVICE_ENDPOINT')  # 🌐 Azure endpoint
cog_key = os.getenv('AI_SERVICE_KEY')            # 🔐 API key
```

### 🎯 Face Detection Features
The application analyzes these facial attributes:
- 📐 **Head Pose**: Yaw, Pitch, and Roll angles
- 👁️ **Occlusion**: Whether forehead, eyes, or mouth are covered
- 🕶️ **Accessories**: Glasses, masks, etc.

### 🔍 Face Detection Process

1. **Initialize Face Client** 🤖
   ```python
   face_client = FaceClient(
       endpoint=cog_endpoint,
       credential=AzureKeyCredential(cog_key)
   )
   ```

2. **Specify Features to Detect** 📊
   ```python
   features = [
       FaceAttributeTypeDetection01.HEAD_POSE,      # 📐 Head orientation
       FaceAttributeTypeDetection01.OCCLUSION,     # 👁️ Covered areas
       FaceAttributeTypeDetection01.ACCESSORIES    # 🕶️ Accessories
   ]
   ```

3. **Detect Faces** 🔍
   ```python
   detected_faces = face_client.detect(
       image_content=image_data.read(),
       detection_model=FaceDetectionModel.DETECTION01,
       recognition_model=FaceRecognitionModel.RECOGNITION01,
       return_face_attributes=features
   )
   ```

4. **Extract Face Attributes** 📋
   For each detected face, the code extracts:
   - Head pose angles (yaw, pitch, roll)
   - Occlusion status for forehead, eyes, and mouth
   - Detected accessories

5. **Annotate Image** 🎨
   The `annotate_faces()` function:
   - Draws green bounding boxes around detected faces
   - Labels each face with a number
   - Saves the annotated image as `detected_faces.jpg`

## 🎮 Running the Application

### Basic Usage (Default Image)
```bash
python analyze-faces.py
```

### Custom Image
```bash
python analyze-faces.py images/faces.jpg
```

## 📊 Sample Output

When you run the application, you'll see output like this:

```
2 faces detected.

Face number 1
 - Head Pose (Yaw): -5.2
 - Head Pose (Pitch): -10.0
 - Head Pose (Roll): -8.1
 - Forehead occluded?: False
 - Eye occluded?: False
 - Mouth occluded?: False
 - Accessories:

Annotating faces in image...
  Results saved in detected_faces.jpg

Face number 2
 - Head Pose (Yaw): -8.3
 - Head Pose (Pitch): -9.2
 - Head Pose (Roll): -6.3
 - Forehead occluded?: False
 - Eye occluded?: False
 - Mouth occluded?: False
 - Accessories:
   - AccessoryType.GLASSES

Annotating faces in image...
  Results saved in detected_faces.jpg
```

## 🔧 Key Components Explained

### 🤖 FaceClient
The main interface to Azure Face API that handles authentication and API calls.

### 📐 Head Pose Analysis
- **Yaw**: Left-right head rotation (-180° to +180°)
- **Pitch**: Up-down head tilt (-90° to +90°)
- **Roll**: Head rotation around the ear-to-ear axis (-180° to +180°)

### 👁️ Occlusion Detection
Determines if facial features are covered or hidden:
- Forehead occlusion
- Eye occlusion
- Mouth occlusion

### 🕶️ Accessories Detection
Identifies accessories worn by the person:
- Glasses
- Sunglasses
- Masks
- Headwear

### 🎨 Image Annotation
Creates visual output with:
- Green bounding boxes around faces
- Face numbering for easy identification
- Saved annotated image for review

## 🚨 Error Handling

The application includes comprehensive error handling:
- Checks for valid Azure credentials
- Handles missing image files
- Manages API connection issues
- Provides meaningful error messages

## 📝 Notes

- 🖼️ Supports common image formats (JPG, PNG, etc.)
- 🎯 Default image is `images/face1.jpg`
- 💾 Output is saved as `detected_faces.jpg`
- 🔄 Overwrites previous detection results
- 🌈 Uses light green color for annotations

## 🤝 Contributing

Feel free to contribute improvements or report issues!

## 📜 License

This project is part of Microsoft Learn AI Vision course materials.
