# 📖 OCR Text Reading with Azure AI Vision - Python Edition

Welcome to the OCR (Optical Character Recognition) Python implementation! This project demonstrates how to extract and read text from images using Azure AI Vision services. 🤖✨

## 📁 Project Structure

```
python/
├── 📄 README.md          # This comprehensive guide
├── 📄 readme.txt         # Simple text description
└── read-text/            # Main OCR application
    ├── 🔐 .env           # Environment configuration (API keys)
    ├── 🐍 read-text.py   # Main OCR application script
    ├── 📋 requirements.txt # Python dependencies
    ├── 📁 images/        # Sample images for testing
    │   ├── Business-card.jpg
    │   ├── Lincoln.jpg
    │   └── Note.jpg
    ├── 📁 labenv/        # Virtual environment (if created)
    └── 🖼️ lines.jpg      # Output image with annotations
```

## 🚀 Features

This OCR application provides the following capabilities:

- 📸 **Text Detection**: Extract text from various image formats
- 🎯 **Line Recognition**: Identify and annotate text lines in images
- 📝 **Word Detection**: Individual word recognition and bounding box detection
- 🖼️ **Visual Annotation**: Generate annotated images showing detected text areas
- 💾 **Multiple Output**: Console text output + annotated image files

## 🛠️ Prerequisites

Before running the application, ensure you have:

- 🐍 **Python 3.7+** installed
- 🔑 **Azure AI Services** resource with valid endpoint and key
- 📦 **Required Python packages** (see installation section)

## ⚙️ Installation & Setup

### 1. 📥 Install Dependencies

Navigate to the `read-text` folder and install required packages:

```bash
pip install -r requirements.txt
```

**Required packages:**
- `dotenv` - Environment variable management 🔧
- `matplotlib` - Image plotting and visualization 📊
- `pillow` - Image processing 🖼️
- `azure-ai-vision-imageanalysis==1.0.0` - Azure AI Vision SDK 🤖

### 2. 🔐 Configure Environment

Update the `.env` file with your Azure AI Services credentials:

```env
AI_SERVICE_ENDPOINT=your_azure_endpoint_here
AI_SERVICE_KEY=your_azure_key_here
```

**📝 Note**: Never commit your actual API keys to version control!

## 🎮 Usage

### Basic Usage

Run the script with the default image:

```bash
python read-text.py
```

This will process the default image (`images/street.jpg`) and:
- 📖 Print extracted text to console
- 🖼️ Generate `lines.jpg` with line annotations

### Custom Image Processing

Process a specific image file:

```bash
python read-text.py path/to/your/image.jpg
```

## 📋 How It Works

### 🔄 Application Flow

1. **🔧 Initialization**: Load environment variables and configure Azure client
2. **📸 Image Loading**: Read image file as binary data
3. **🤖 AI Analysis**: Send image to Azure AI Vision for text analysis
4. **📖 Text Extraction**: Extract and display detected text
5. **🎨 Annotation**: Create visual annotations showing text locations
6. **💾 Output**: Save annotated images and display results

### 🧩 Key Functions

#### `main()`
- 🎯 Main application entry point
- 🔐 Handles authentication and configuration
- 📸 Processes image and displays results

#### `annotate_lines(image_file, detected_text)`
- 🖼️ Creates visual annotations for text lines
- 🎨 Draws cyan bounding polygons around detected lines
- 💾 Saves result as `lines.jpg`

#### `annotate_words(image_file, detected_text)`
- 📝 Creates visual annotations for individual words
- 🎨 Draws cyan bounding polygons around each word
- 💾 Saves result as `words.jpg`

## 📊 Sample Output

When processing an image, you'll see output like:

```
Reading text in images/Business-card.jpg

Text:
 Dr. Sarah Johnson
 Senior Data Scientist
 Contoso Corporation
 sarah.johnson@contoso.com
 +1 (555) 123-4567

Annotating lines of text in image...
  Results saved in lines.jpg
```

## 🖼️ Sample Images

The project includes three test images:

- 📇 **Business-card.jpg**: Business card with contact information
- 🏛️ **Lincoln.jpg**: Historical document or monument text
- 📝 **Note.jpg**: Handwritten or printed note

## 🔧 Troubleshooting

### Common Issues & Solutions

#### ❌ Authentication Errors
- ✅ Verify your Azure AI Services endpoint and key in `.env`
- ✅ Ensure your Azure resource has OCR capabilities enabled

#### ❌ Image File Errors
- ✅ Check image file path and format (supports JPG, PNG, BMP)
- ✅ Ensure image file exists and is readable

#### ❌ Package Import Errors
- ✅ Run `pip install -r requirements.txt` to install dependencies
- ✅ Consider using a virtual environment

#### ❌ No Text Detected
- ✅ Ensure image contains readable text
- ✅ Check image quality and resolution
- ✅ Verify text is in a supported language

## 🔄 Extending the Application

### Adding Word-Level Detection

The code includes a `annotate_words()` function that's not currently called. To enable word-level detection, add this line in the `main()` function after the line annotation:

```python
# Add after annotate_lines() call
annotate_words(image_file, result.read)
```

### Supporting Multiple Languages

Azure AI Vision supports multiple languages. The service automatically detects the language, but you can also specify language preferences in the API call.

### Batch Processing

To process multiple images, you could extend the script to:
- 📁 Process entire directories
- 🔄 Handle multiple file formats
- 📊 Generate summary reports

## 🔗 Related Resources

- 📚 [Azure AI Vision Documentation](https://docs.microsoft.com/azure/cognitive-services/computer-vision/)
- 🐍 [Azure AI Vision Python SDK](https://pypi.org/project/azure-ai-vision-imageanalysis/)
- 🎓 [Microsoft Learn: Read Text in Images](https://docs.microsoft.com/learn/modules/read-text-images-documents-with-computer-vision-service/)

## 📜 License

This project is part of Microsoft Learn AI Vision course materials.

---

**🎉 Happy OCR Processing!** 

For questions or issues, refer to the Microsoft Learn documentation or Azure AI Vision service documentation. 📖✨
