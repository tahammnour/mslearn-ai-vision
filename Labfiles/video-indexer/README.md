# 📹 Video Indexer Lab

Welcome to the Azure Video Indexer lab! This folder contains scripts and resources to help you analyze videos using Azure Video Indexer's powerful AI capabilities.

## 🎯 Overview

Azure Video Indexer is a cloud application built on Azure AI services that extracts insights from videos using artificial intelligence. This lab demonstrates how to:

1. Upload and index videos
2. Retrieve video metadata and insights
3. Embed video players with security features

## 🚀 Getting Started

### Prerequisites

- Azure Video Indexer account
- API subscription key
- Account ID

### 📋 Step-by-Step Process

#### 1. 📤 Upload Video
Visit [Azure Video Indexer Portal](https://www.videoindexer.ai) to upload your video file.

#### 2. ⏳ Wait for Indexing
After uploading, the system will automatically process and index your video. This may take several minutes depending on the video length and complexity.

#### 3. 🔧 Configure API Access
You'll need two essential pieces of information:

**🔑 API Key**: 
- Visit [Video Indexer API Portal](https://api-portal.videoindexer.ai/profile)
- Copy your Primary or Secondary subscription key

**🆔 Account ID**:
- Go to [Video Indexer Portal](https://www.videoindexer.ai/)
- Find your Account ID in your profile/account settings

#### 4. 🔐 Secure Implementation
Use the HTML template (`analyze-video.html`) to embed video players securely in your web applications.

## 📁 Files in This Folder

| File | Description |
|------|-------------|
| `📄 get-videos.ps1` | PowerShell script to retrieve video list |
| `📄 get-videos.sh` | Bash script to retrieve video list |
| `🎬 responsible_ai.mp4` | Sample video file for testing |
| `🌐 analyze-video.html` | HTML template for embedding videos |

## 🖥️ Script Explanation: get-videos.sh

Let's break down the bash script functionality:

### 📝 Configuration Section
```bash
account_id="5e316dbd-4d97-45f2-8534-5b334ddec11e"
api_key="15aa64f5943348a685f7b92c6ad0a0c1"
location="trial"
```
- **account_id**: Your unique Video Indexer account identifier
- **api_key**: Your subscription key from the API portal
- **location**: The region where your account is hosted
  - **"trial"** for free/trial accounts
  - **Your Azure region** (e.g., "eastus", "westus2") for unrestricted accounts with associated Azure resources

### 🔐 Authentication Process
```bash
token=$(curl -s -X GET "https://api.videoindexer.ai/auth/$location/Accounts/$account_id/AccessToken" \
  -H "Ocp-Apim-Subscription-Key: $api_key" \
  | tr -d '"')
```

**What this does:**
- 🌐 Makes an HTTP GET request to the Video Indexer authentication endpoint
- 📧 Sends the API key in the header (`Ocp-Apim-Subscription-Key`)
- 🧹 Removes quotes from the response using `tr -d '"'`
- 💾 Stores the access token for subsequent API calls

### ✅ Error Handling
```bash
if [ -z "$token" ]; then
  echo "❌ Failed to get access token. Please check your API key and account ID."
  exit 1
fi
```

**Purpose:**
- 🔍 Checks if the token is empty
- ⚠️ Displays error message if authentication fails
- 🚪 Exits the script to prevent further execution

### 📊 Data Retrieval
```bash
curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$token" \
  -H "Content-Type: application/json" \
  | jq .
```

**Functionality:**
- 🔗 Makes authenticated request to retrieve video list
- 🎫 Uses the access token for authorization
- 📋 Sets appropriate content type header
- 🎨 Formats JSON response using `jq` for better readability

## 🛠️ Usage Instructions

### For Windows (PowerShell)
```powershell
# Update the script with your credentials
$account_id="YOUR_ACCOUNT_ID"
$api_key="YOUR_API_KEY"

# Run the script
.\get-videos.ps1
```

### For Linux/macOS (Bash)
```bash
# Make the script executable
chmod +x get-videos.sh

# Update the script with your credentials
# Edit the account_id and api_key variables

# Run the script
./get-videos.sh
```

## 🔧 Configuration Steps

### 1. 🔑 Get Your API Key
1. Navigate to [Video Indexer API Portal](https://api-portal.videoindexer.ai/profile)
2. Sign in with your Azure account
3. Copy your Primary or Secondary subscription key
4. Replace `YOUR_API_KEY` in the script

### 2. 🆔 Get Your Account ID
1. Go to [Video Indexer Portal](https://www.videoindexer.ai/)
2. Sign in and access your account settings
3. Copy your Account ID
4. Replace `YOUR_ACCOUNT_ID` in the script

### 3. 🌍 Set Location
- **Free/Trial accounts**: Use "trial" as the location
- **Unrestricted accounts**: If you have created an unrestricted Video Indexer account (with an associated Azure resource), change this to the location where your Azure resource is provisioned (for example "eastus", "westus2", "westeurope")

> ⚠️ **Important**: Observe that the location for a free account is "trial". If you have created an unrestricted Video Indexer account (with an associated Azure resource), you can change this to the location where your Azure resource is provisioned (for example "eastus").

## 📤 Expected Output

When you run the script successfully, you'll receive a JSON response containing:

- 📋 List of all videos in your account
- 🆔 Video IDs and names
- 📊 Processing status and insights availability
- 🕒 Upload and processing timestamps
- 📱 Thumbnail URLs

## 🚨 Troubleshooting

| Issue | Solution |
|-------|----------|
| ❌ Authentication failed | Double-check your API key and Account ID |
| 🌐 Connection timeout | Verify your internet connection |
| 📋 Empty response | Ensure you have videos uploaded to your account |
| 🔧 jq command not found | Install jq: `sudo apt-get install jq` (Linux) or `brew install jq` (macOS) |

## 🔒 Security Best Practices

- 🚫 Never commit API keys to version control
- 🔄 Rotate API keys regularly
- 🔐 Use environment variables for sensitive data
- 🌐 Implement proper access controls in production

## 📚 Additional Resources

- [📖 Video Indexer Documentation](https://docs.microsoft.com/azure/media-services/video-indexer/)
- [🔌 API Reference](https://api-portal.videoindexer.ai/docs/services)
- [🎓 Video Indexer Learning Path](https://docs.microsoft.com/learn/paths/implement-knowledge-mining-with-azure-cognitive-search/)

---
*💡 This lab is part of the Microsoft Learn AI Vision course materials.*
