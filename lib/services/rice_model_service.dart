import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class RiceModelService {
  Interpreter? _interpreter;

  /// List of rice class labels — must match your training model classes
  final List<String> labels = [
    'Arborio',
    'Basmati',
    'Ipsala',
    'Jasmine',
    'Karacadag',
  ];

  /// Loads the TFLite model from Firebase ML
  Future<void> loadModel() async {
    try {
      print("📥 Downloading model from Firebase...");

      final model = await FirebaseModelDownloader.instance.getModel(
        "rice_detector", // Your Firebase ML model name
        FirebaseModelDownloadType.latestModel,
        FirebaseModelDownloadConditions(
          androidWifiRequired: false,
          androidChargingRequired: false,
          androidDeviceIdleRequired: false,
        ),
      );

      print("📁 Model file path: ${model.file.path}");
      if (model.file.existsSync()) {
        print("✅ Model file found, size: ${model.file.lengthSync()} bytes");
      } else {
        print("❌ Model file not found after download!");
        throw Exception("Firebase model file missing.");
      }

      _interpreter = await Interpreter.fromFile(model.file);
      print("✅ Rice model loaded successfully.");

      // Debug: print input/output tensor info
      var inputShape = _interpreter!.getInputTensor(0).shape;
      var inputType = _interpreter!.getInputTensor(0).type;
      var outputShape = _interpreter!.getOutputTensor(0).shape;
      var outputType = _interpreter!.getOutputTensor(0).type;

      print("📥 Model input: shape=$inputShape, type=$inputType");
      print("📤 Model output: shape=$outputShape, type=$outputType");
    } catch (e) {
      print("❌ Error loading model: $e");
      rethrow;
    }
  }

  /// Converts image to normalized tensor [1, height, width, 3] in RGB
  List<List<List<List<double>>>> _imageToTensor(img.Image resized) {
    return [
      List.generate(
        resized.height,
            (y) => List.generate(
          resized.width,
              (x) {
            final pixel = resized.getPixel(x, y);
            return [
              pixel.r / 255.0,
              pixel.g / 255.0,
              pixel.b / 255.0,
            ];
          },
        ),
      ),
    ];
  }

  /// Runs inference on given image file and returns predicted rice type
  Future<String> predictRice(File imageFile) async {
    if (_interpreter == null) {
      throw Exception("Model not loaded. Call loadModel() first.");
    }

    // Decode the image
    final rawImage = img.decodeImage(await imageFile.readAsBytes());
    if (rawImage == null) {
      throw Exception("❌ Could not decode image.");
    }

    // Get model input size
    final inputShape = _interpreter!.getInputTensor(0).shape; // [1, h, w, 3]
    final inputHeight = inputShape[1];
    final inputWidth = inputShape[2];

    // Resize image
    final resized = img.copyResize(rawImage, width: inputWidth, height: inputHeight);

    // Convert to tensor
    final input = _imageToTensor(resized);

    // Prepare output buffer
    var output = List.filled(labels.length, 0.0).reshape([1, labels.length]);

    try {
      _interpreter!.run(input, output);

      // Cast dynamic output to double
      final scores = List<double>.from(output[0]);

      final maxScore = scores.reduce((a, b) => a > b ? a : b);
      final maxIndex = scores.indexOf(maxScore);

      print("🔎 Model output scores: $scores");
      print("✅ Predicted rice: ${labels[maxIndex]} with confidence ${maxScore.toStringAsFixed(2)}");

      return labels[maxIndex];
    } catch (e) {
      print("❌ Error running model inference: $e");
      rethrow;
    }
  }

  /// Releases model resources
  void close() {
    _interpreter?.close();
    print("🗑️ Interpreter closed.");
  }
}
