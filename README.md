# 🍚 Rice Detector — AI-Powered Rice Classification & Health Insights

## 📌 Overview

**Rice Detector** is an AI-powered Flutter mobile application that identifies rice varieties from images and provides health-related insights, with a focus on dietary considerations for diabetic patients.

The app integrates **on-device machine learning** with **cloud-based generative AI** to deliver fast, accurate predictions and meaningful nutritional guidance.

---

## 🚀 Key Features

### 🔍 Rice Variety Identification

* Capture an image or select from the gallery
* On-device inference using a custom TensorFlow Lite model
* Supports multiple rice varieties such as:

  * Basmati
  * Arborio
  * Jasmine
  * Ipsala
  * Karacadag
  * and more

---

### 🧠 AI-Generated Health Insights

* Uses Google Gemini API to generate structured health information
* Provides benefits and dietary considerations for diabetic patients
* Displays clear, point-wise explanations
* Easy-to-read results screen

---

### ☁️ Dynamic Model Delivery (Firebase ML)

* Automatically downloads the latest ML model version
* Enables seamless model updates without app redeployment
* Secure and reliable hosting of model files

---

### 📱 Smooth Mobile Experience

* Clean, modern UI with agricultural-themed design
* Fast inference even on low-end devices
* Simple camera and gallery permissions
* Fully on-device classification (no internet required for prediction)

---

## 🛠️ Technology Stack

* **Flutter & Dart** — Cross-platform mobile development
* **TensorFlow Lite** — On-device machine learning inference
* **Firebase ML Model Downloader** — Dynamic model updates
* **Google Gemini API** — Generative AI health insights
* **Permission Handler** — Runtime permissions
* **image package** — Image preprocessing

---

## ⚙️ System Workflow

1. User captures or selects an image of rice grains
2. Image is resized and preprocessed
3. TFLite model performs classification on-device
4. Predicted rice variety is sent to Gemini API
5. Gemini generates health insights
6. Results are displayed in a structured UI

---

## 🧪 Use Cases

* Dietary awareness for diabetic patients
* Nutritional guidance for rice consumption
* Agricultural education and grain classification
* Demonstration of Mobile AI + Generative AI integration
* Academic and research projects

---

## 📊 Supported Rice Varieties

The application is trained to recognize multiple rice types commonly used worldwide. Support for additional varieties can be added through model updates.

---

## 📦 Installation

### Prerequisites

* Flutter SDK installed
* Android Studio or VS Code
* Android device or emulator

## 🔒 Permissions Required

* Camera — for capturing rice images
* Storage / Photos — for selecting images from gallery
* Internet — for fetching AI health insights

---

## 🔮 Future Enhancements

* Support for additional rice varieties
* Improved model accuracy and performance
* Offline caching of health information
* Multi-language support
* Nutritional comparison between rice types
* Real-time camera classification

---

## 👨‍💻 Author

**Naveen**
Final Year Engineering Student
Aspiring Software Engineer | AI & Mobile Developer

---

## ⭐ Acknowledgements

* TensorFlow Lite Team
* Firebase ML
* Google Gemini API
* Flutter Community

---

## 🌟 If you found this project useful, consider giving it a star!
