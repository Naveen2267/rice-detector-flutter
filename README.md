# know_your_rice

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

🍚 Rice Detector – Flutter App
AI-Powered Rice Classification & Health Insights

Rice Detector is an AI-driven Flutter application that identifies different rice varieties from an image and provides health-related insights tailored especially for diabetic patients.
The app combines TensorFlow Lite, Firebase ML Model Downloader, and the Google Gemini API to deliver fast, accurate predictions and meaningful health information.

🚀 Features
🔍 Rice Identification
Upload or capture an image of rice grains
On-device AI classification using a custom TFLite model
Identifies multiple rice varieties (Basmati, Arborio, Jasmine, Ipsala, Karacadag, etc.)

🧠 Health Insights (Gemini API)
Fetches structured, point-wise health information
Explains benefits and effects of the detected rice on diabetic patients
Easy-to-read, scrollable result layout

☁️ Firebase ML Integration
Automatically downloads the latest model version
No need to update the app for model improvements
Reliable and secure model hosting

📱 Smooth User Experience
Modern, clean UI with green agricultural-themed gradients
Simple camera & gallery permissions
Fast inference even on low-end devices

🛠️ Tech Stack
Flutter & Dart
TensorFlow Lite
Firebase ML Model Downloader
Google Gemini API
Permission Handler
image package for preprocessing

📷 How It Works
Take a photo or choose one from your gallery
Image is resized and processed
TFLite model predicts the rice variety
The detected rice type is sent to Gemini
Gemini returns point-wise benefits and health effects
The app displays everything in a clean results screen

🧪 Use Cases
Dietary awareness for diabetic patients
Food & nutritional analysis
Agriculture and grain classification education
Demonstrating Mobile AI + Generative AI integration

📦 Project Status
This project is actively evolving with plans for:
Adding more rice classes
Improved model accuracy
Offline health info caching
Multi-language support
