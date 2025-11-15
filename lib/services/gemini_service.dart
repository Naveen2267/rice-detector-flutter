import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  // The API key is now loaded from the .env file
  static final String _apiKey = dotenv.env['GEMINI_API_KEY']!;

  Future<String> getRiceInfo(String riceType) async {
    final response = await http.post(

      Uri.parse("https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$_apiKey"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                "Give health-related information about $riceType rice in point form. Include separate sections for benefits and effects on diabetic patients."
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"] ?? "No response";
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}, body: ${response.body}");
    }
  }
}
