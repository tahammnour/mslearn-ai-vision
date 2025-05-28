# Azure AI Vision - Image Analysis Project

This project demonstrates how to use Azure AI Vision service to analyze images and extract various visual features including captions, tags, objects, and people detection.

## 📋 Project Overview

The image analysis application uses Azure AI Vision API to:
- Generate image captions and dense captions
- Extract image tags with confidence scores
- Detect and locate objects in images
- Detect and locate people in images
- Generate annotated images with bounding boxes

## 🚀 Quick Start

### Prerequisites

- Python 3.7 or higher
- Azure AI Vision service resource
- Git (for cloning the repository)

### Step 1: Navigate to Project Directory
```bash
cd /workspaces/mslearn-ai-vision/Labfiles/analyze-images/python/image-analysis
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
Edit the `.env` file with your Azure AI Vision service credentials:
```properties
AI_SERVICE_ENDPOINT=your_azure_ai_vision_endpoint
AI_SERVICE_KEY=your_azure_ai_vision_key
```

### Step 6: Run the Application
```bash
# Analyze the default street.jpg image
python image-analysis.py

# Analyze a specific image
python image-analysis.py images/building.jpg
python image-analysis.py images/person.jpg
```

## 📁 Project Structure

```
image-analysis/
├── .env                    # Azure service configuration
├── image-analysis.py       # Main application script
├── requirements.txt        # Python dependencies
├── images/                 # Sample images for analysis
│   ├── street.jpg
│   ├── building.jpg
│   └── person.jpg
├── objects.jpg            # Generated annotated image (objects)
├── people.jpg             # Generated annotated image (people)
└── labenv/                # Virtual environment (after setup)
```

## 🔧 Dependencies

The project uses the following Python packages:

- `azure-ai-vision-imageanalysis==1.0.0` - Azure AI Vision SDK
- `dotenv` - Environment variable management
- `matplotlib` - Image visualization and saving
- `pillow` - Image processing library

## 📖 Code Explanation

### Main Components

#### 1. Environment Configuration
```python
load_dotenv()
ai_endpoint = os.getenv('AI_SERVICE_ENDPOINT')
ai_key = os.getenv('AI_SERVICE_KEY')
```
Loads Azure credentials from the `.env` file for secure API access.

#### 2. Azure AI Vision Client Setup
```python
cv_client = ImageAnalysisClient(
    endpoint=ai_endpoint,
    credential=AzureKeyCredential(ai_key)
)
```
Initializes the Azure AI Vision client with authentication credentials.

#### 3. Image Analysis
```python
result = cv_client.analyze(
    image_data=image_data,
    visual_features=[
        VisualFeatures.CAPTION,
        VisualFeatures.DENSE_CAPTIONS,
        VisualFeatures.TAGS,
        VisualFeatures.OBJECTS,
        VisualFeatures.PEOPLE
    ]
)
```
Analyzes the image and extracts multiple visual features in a single API call.

#### 4. Feature Extraction

**Captions**: Generates descriptive text about the image content
```python
if result.caption is not None:
    print(" Caption: '{}' (confidence: {:.2f}%)".format(
        result.caption.text, 
        result.caption.confidence * 100
    ))
```

**Tags**: Identifies objects, scenes, and concepts with confidence scores
```python
if result.tags is not None:
    for tag in result.tags.list:
        print(" Tag: '{}' (confidence: {:.2f}%)".format(
            tag.name, 
            tag.confidence * 100
        ))
```

**Objects**: Detects and locates specific objects with bounding boxes
```python
if result.objects is not None:
    for detected_object in result.objects.list:
        print(" {} (confidence: {:.2f}%)".format(
            detected_object.tags[0].name,
            detected_object.tags[0].confidence * 100
        ))
```

**People**: Detects human figures with location coordinates
```python
if result.people is not None:
    for detected_person in result.people.list:
        if detected_person.confidence > 0.2:
            print(" {} (confidence: {:.2f}%)".format(
                detected_person.bounding_box,
                detected_person.confidence * 100
            ))
```

#### 5. Image Annotation Functions

**show_objects()**: Creates annotated images with object bounding boxes
- Opens the original image using PIL
- Draws cyan rectangles around detected objects
- Adds text labels for each object
- Saves the result as `objects.jpg`

**show_people()**: Creates annotated images with people bounding boxes
- Similar to object annotation but for detected people
- Filters results by confidence threshold (>20%)
- Saves the result as `people.jpg`

### Key Features

1. **Multi-Feature Analysis**: Extracts multiple visual features in one API call
2. **Confidence Scoring**: All detections include confidence percentages
3. **Visual Annotation**: Generates images with bounding boxes and labels
4. **Flexible Input**: Accepts different image files via command line arguments
5. **Error Handling**: Includes exception handling for API errors

## 📸 Sample Images

The project includes three sample images:

- **street.jpg**: Urban scene with multiple objects and people
- **building.jpg**: Architectural structure
- **person.jpg**: Portrait or person-focused image

## 📤 Downloading Generated Images

After running the analysis, the application generates annotated images:

### If running locally:
The images are saved in the same directory and can be accessed directly.

### If running in VS Code (Codespaces/Dev Container):
1. Look for `objects.jpg` and `people.jpg` in the file explorer
2. Right-click on the files and select "Download"

### Alternative download methods:
- Use VS Code's built-in download functionality
- Start a simple HTTP server: `python -m http.server 8000`
- Use SCP or SFTP for remote environments

## 🔍 Understanding the Output

### Console Output
- **Caption**: Main description of the image
- **Dense Captions**: Multiple detailed descriptions of image regions
- **Tags**: List of identified concepts with confidence scores
- **Objects**: Detected objects with confidence levels
- **People**: Located people with bounding box coordinates

### Generated Files
- **objects.jpg**: Original image with cyan bounding boxes around detected objects
- **people.jpg**: Original image with cyan bounding boxes around detected people

## 🛠️ Troubleshooting

### Common Issues

1. **API Key Errors**: Verify your `.env` file contains correct Azure credentials
2. **Module Import Errors**: Ensure virtual environment is activated and dependencies are installed
3. **Image Not Found**: Check that image files exist in the `images/` directory
4. **Permission Errors**: Ensure write permissions for generating output images

### Error Examples
```bash
# If you see module import errors
pip install -r requirements.txt

# If Azure authentication fails
# Check your .env file configuration

# If image file not found
ls images/  # Verify available images
```

## 🔒 Security Notes

- Never commit your `.env` file with real credentials to version control
- Keep your Azure AI Vision keys secure and rotate them regularly
- Use environment variables or Azure Key Vault in production environments

## 📚 Learning Objectives

This project demonstrates:
- Azure AI Vision API integration
- Computer vision concepts (object detection, image classification)
- Python image processing with PIL and matplotlib
- Environment configuration and security best practices
- Virtual environment management

## 🔗 Additional Resources

- [Azure AI Vision Documentation](https://docs.microsoft.com/azure/cognitive-services/computer-vision/)
- [Azure AI Vision Python SDK](https://pypi.org/project/azure-ai-vision-imageanalysis/)
- [Azure Cognitive Services](https://azure.microsoft.com/services/cognitive-services/)

## 📄 License

This project is part of Microsoft Learn AI Vision exercises and follows Microsoft's licensing terms.
