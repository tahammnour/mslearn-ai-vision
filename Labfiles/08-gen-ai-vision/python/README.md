# 🤖 Generative AI Vision Chat Application

Welcome to the **Generative AI Vision Chat Application**! 🚀 This Python application demonstrates how to use Azure AI services to analyze images and generate intelligent responses using AI models.

## 📋 Prerequisites

Before running this application, you need:

- 🐍 Python 3.8 or higher
- 🔑 Azure subscription
- 🏢 Azure AI Hub and AI Foundry project
- 🔗 Project connection string from Azure AI Foundry

## 🎯 Important Notes: Setting Up Azure AI Hub

⚠️ **Critical Setup Instructions:**

1. 🏗️ **Create Azure AI Hub First**: Always create an Azure AI Hub from the Azure portal before setting up your project
2. 🎭 **Choose Azure AI Foundry**: When creating a new project, make sure to select "Azure AI Foundry" as your platform
3. 🔗 **Connection String**: This setup ensures you get the proper connection string options in your project settings
4. 📊 **Project Management**: The AI Hub provides centralized management for all your AI projects and resources

## 📦 Installation

### 1. 🛠️ Install Required Packages

```bash
# Install required Python packages
pip install dotenv
pip install azure-identity
pip install azure-ai-projects==1.0.0b9
pip install azure-ai-inference==1.0.0b9
```

### 2. 🏠 Create Virtual Environment (Recommended)

```bash
# Create a virtual environment
python -m venv labenv

# Activate the virtual environment
# On Linux/macOS 🐧🍎
source labenv/bin/activate

# On Windows 🪟
labenv\Scripts\activate
```

### 3. ⚙️ Configure Environment Variables

Update the `.env` file with your Azure AI project details:

```env
PROJECT_CONNECTION="your_project_connection_string"  # 🔗 From Azure AI Hub project
MODEL_DEPLOYMENT="your_model_deployment"             # 🤖 Your deployed model name
```

## 🚀 Running the Application

```bash
python chat-app.py
```

## 📊 Sample Output

Here's what you can expect when running the application:

### 🖼️ Local Image Analysis (mystery-fruit.jpeg)
```
Ask a question about the image
(or type 'quit' to exit)
What is this fruit? What recipes could I use it in?
Getting a response ...

This is a dragon fruit. You can use it in various recipes such as dragon fruit salads, dragon fruit smoothies, as a fresh topping for shaved ice or cocktails, or as a unique addition to desserts like pavlova. Dragon fruit's sweet and slightly citrusy flavor makes it a versatile ingredient for both sweet and savory dishes.

Ask a question about the image
(or type 'quit' to exit)
```

### 🌐 URL-based Image Analysis (orange.jpeg)
```
Ask a question about the image
(or type 'quit' to exit)
Suggest some recipes that include this fruit
Getting a response ...

Whole oranges are a great addition to many dishes. Here are some ideas you could try:
- Orange and peanut butter smoothie 🥤
- Oranges in a fruit salad 🥗
- Orange reduced sugar syrup 🍯
- Orange salad vinaigrette 🥗
- Sweet orange and rice pudding 🍮
- Orange and ginger cookies 🍪
- Orange chicken or cookies recipe 🍗
This fruit can also be used as a garnish or a topping on a yogurt, oatmeal, or granola. 🥣

Ask a question about the image
(or type 'quit' to exit)
```

### 🔄 OpenAI Client Version (chat-app-openai.py)
```
Ask a question about the image
(or type 'quit' to exit)
What is this fruit? What recipes could I use it in?
Getting a response ...

This fruit is called dragon fruit, also known as pitaya or pitahaya. It comes from several different species of cactus native to Central America but is now widely grown in Asia as well. The flesh can be white (like in your photo), red, or even magenta, and it contains tiny black seeds.

Dragon fruit has a mildly sweet, refreshing taste and is great both fresh and in recipes!

Here are a few ways you could use dragon fruit:

1. Eat it Fresh: Simply scoop out the flesh with a spoon and enjoy on its own or sprinkled with a little lime juice.
2. Fruit Salad: Dragon fruit adds a pop of color and texture to fruit salads. Pair it with mango, kiwi, pineapple, and berries.
3. Smoothies: Blend with mango, banana, yogurt, and a splash of orange juice for a tropical smoothie.
4. Dragon Fruit Bowl: Use it as a topping for smoothie bowls along with granola, coconut, and other fruits.
5. Sorbet or Popsicles: Puree dragon fruit with a little honey and freeze into popsicles or churn into a sorbet.
6. Salsas: Dice dragon fruit and mix with avocado, red onion, cilantro, and lime for a fun salsa to top grilled fish or chicken.
7. Cocktails or Mocktails: Muddle dragon fruit into drinks for a vibrant, refreshing twist.

Let me know if you'd like a specific recipe!

Ask a question about the image
(or type 'quit' to exit)
```

## 🧠 Code Explanation

The project includes two main application files that demonstrate different approaches to Azure AI integration:

### 📄 **chat-app.py** - Azure AI Inference Client
This is the main application using Azure AI Inference SDK for modern multi-modal AI interactions.

### 📄 **chat-app-openai.py** - OpenAI Client Integration  
This alternative version uses the OpenAI client through Azure AI Projects for compatibility with OpenAI SDK patterns.

### 📁 Main Components

#### 1. 📚 **Import Libraries**
```python
# Standard libraries
import os
from urllib.request import urlopen, Request
import base64
from pathlib import Path

# Azure AI libraries
from dotenv import load_dotenv
from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient

# For chat-app.py - Azure AI Inference
from azure.ai.inference.models import (
     SystemMessage, UserMessage, TextContentItem, 
     ImageContentItem, ImageUrl
)

# For chat-app-openai.py - OpenAI compatibility
import openai
```

#### 2. 🔧 **Configuration Setup**
- 📄 Loads environment variables from `.env` file
- 🔗 Retrieves project connection string and model deployment name
- 🛡️ Uses `DefaultAzureCredential` for secure authentication

#### 3. 🤖 **AI Client Initialization**

**For chat-app.py (Azure AI Inference):**
```python
# Modern Azure AI approach
chat_client = project_client.inference.get_chat_completions_client(model=model_deployment)
```

**For chat-app-openai.py (OpenAI Client):**
```python
# OpenAI-compatible approach
chat_client = project_client.inference.get_azure_openai_client(api_version="2024-10-21")
```

#### 4. 🔄 **Interactive Loop**
- 📝 Prompts user for questions about the image
- 🖼️ Processes the local `mystery-fruit.jpeg` image
- 📤 Sends both text prompt and image to the AI model
- 💭 Displays AI-generated responses

#### 5. 🖼️ **Image Processing**
Both applications use the same local image processing approach:
- 📁 Reads local `mystery-fruit.jpeg` file
- 🔄 Converts to base64 encoding
- 📊 Creates data URL format for AI processing

#### 6. 💬 **Message Format Differences**

**Azure AI Inference (chat-app.py):**
```python
response = chat_client.complete(
    messages=[
        SystemMessage(system_message),
        UserMessage(content=[
            TextContentItem(text=prompt),
            ImageContentItem(image_url=ImageUrl(url=data_url))
        ]),
    ]
)
```

**OpenAI Client (chat-app-openai.py):**
```python
response = chat_client.chat.completions.create(
    model=model_deployment,
    messages=[
        { "role": "system", "content": system_message },
        { "role": "user", "content": [  
            { "type": "text", "text": prompt },
            { "type": "image_url", "image_url": { "url": data_url } }
        ] } 
    ]
)
```

### 🔍 **Key Features**

- 🎭 **Multi-modal AI**: Combines text and image understanding
- 🛒 **Domain-specific**: Configured as a grocery store assistant
- 🔄 **Interactive**: Continuous conversation until user types 'quit'
- 🛡️ **Secure**: Uses Azure credential management
- ⚡ **Real-time**: Immediate responses to user queries

## 📝 File Structure

```
python/
├── 📄 chat-app.py              # Main application (Azure AI Inference)
├── 📄 chat-app-openai.py       # Alternative app (OpenAI Client)
├── 🔐 .env                     # Environment configuration
├── 📋 requirements.txt         # Python dependencies
├── 📖 README.md               # This documentation
├── 🖼️ mystery-fruit.jpeg       # Sample test image
└── 📁 labenv/                 # Virtual environment (if created)
```

## 🎯 Usage Tips

1. 🍊 **Try Different Questions**: Ask about recipes, nutrition, storage tips, or cooking methods
2. 🖼️ **Image Context**: The AI analyzes the orange image and provides relevant responses
3. 🔄 **Continuous Chat**: Keep asking questions - the conversation continues until you type 'quit'
4. 🛒 **Grocery Context**: The AI is configured as a grocery store assistant for fruit-related queries

## 🚨 Troubleshooting

- 🔑 **Authentication Issues**: Ensure your Azure credentials are properly configured
- 🔗 **Connection Problems**: Verify your PROJECT_CONNECTION string is correct
- 🤖 **Model Errors**: Check that your MODEL_DEPLOYMENT name matches your Azure setup
- 📦 **Package Issues**: Make sure all required packages are installed with correct versions

## 🎉 Next Steps

- 🖼️ Try uploading different fruit images
- 🔧 Modify the system message for different contexts
- 🚀 Experiment with different AI models
- 📊 Add logging and analytics features

Happy coding! 🎊✨
