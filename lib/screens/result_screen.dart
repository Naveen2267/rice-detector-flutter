import 'dart:io';
import 'package:flutter/material.dart';
import '../services/gemini_service.dart';
import '../services/rice_model_service.dart';
import '../widgets/loading_widget.dart';

class ResultScreen extends StatefulWidget {
  final File image;
  const ResultScreen({super.key, required this.image});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String? riceType;
  String riceInfo = "Fetching details...";
  bool isLoading = true;

  final gemini = GeminiService();
  final modelService = RiceModelService();

  @override
  void initState() {
    super.initState();
    _analyzeRice();
  }

  Future<void> _analyzeRice() async {
    try {
      print("🔍 Loading rice model...");
      await modelService.loadModel();

      print("🔍 Starting rice prediction...");
      try {
        riceType = await modelService.predictRice(widget.image);
        print("✅ Predicted rice type: $riceType");
      } catch (e) {
        print("❌ Error in predictRice: $e");
        riceType = null;
      }

      if (riceType != null) {
        try {
          print("📡 Fetching health info from Gemini for $riceType");
          final info = await gemini.getRiceInfo(riceType!);
          print("✅ Gemini response: $info");

          setState(() {
            riceInfo = info;
            isLoading = false;
          });
        } catch (e) {
          print("❌ Error fetching Gemini info: $e");
          setState(() {
            riceInfo = "Error fetching health info.";
            isLoading = false;
          });
        }
      } else {
        setState(() {
          riceInfo = "❌ Could not identify rice type.";
          isLoading = false;
        });
      }
    } catch (e) {
      print("⚠️ Unexpected error in _analyzeRice: $e");
      setState(() {
        riceInfo = "An unexpected error occurred.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FDF8), // Very light green background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0), // Reduced height
        child: AppBar(
          title: Text(
            "Detection Result",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          backgroundColor: Color(0xFF4CAF50), // Lighter green
          elevation: 0,
          centerTitle: false, // Left aligned
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8FDF8), // Very light green
              Color(0xFFE8F5E8), // Light green
              Color(0xFFF1F8E9), // Rice field green
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: isLoading
                ? const LoadingWidget()
                : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image container with styling
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF4CAF50).withOpacity(0.1),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        widget.image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Detected rice type container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF4CAF50).withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFFE8F5E8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.rice_bowl,
                            size: 32,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Detected Rice",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF66BB6A),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                riceType ?? 'Unknown',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E7D32),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Benefits section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF4CAF50).withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Color(0xFF4CAF50),
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Rice Benefits & Effects",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F8E9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFF81C784).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            riceInfo,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1B5E20),
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}