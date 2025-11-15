import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'gallery_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FDF8), // Very light green background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0), // Reduced height
        child: AppBar(
          title: Text(
            "Rice Detector",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          backgroundColor: Color(0xFF4CAF50), // Lighter green
          elevation: 0,
          centerTitle: false, // Left aligned
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header with rice emoji and decorative container
              Container(
                padding: EdgeInsets.all(24),
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
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F5E8),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "🍚",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Know Your Rice",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Description text
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFE8F5E8).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(0xFF81C784).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  "Rice types have different starch content. "
                      "High starch can affect blood sugar, especially for diabetics. "
                      "This app helps you identify rice type and learn its benefits.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1B5E20),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 40),

              // Camera button
              Container(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.camera_alt, size: 24),
                  label: Text(
                    "Open Camera",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4CAF50), // Medium green
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: Color(0xFF4CAF50).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Gallery button
              Container(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.image, size: 24),
                  label: Text(
                    "Select from Gallery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GalleryScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF66BB6A), // Lighter green
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: Color(0xFF66BB6A).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Bottom decorative elements
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF81C784),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF81C784),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}