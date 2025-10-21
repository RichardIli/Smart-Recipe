import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageFetcherRepository {
  Future<Map<String, dynamic>> _fetchImageData(String itemName) async {
    try {
      final String baseUrl =
          'https://gemini-flash-back-end.vercel.app/api/retreiveImage';

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'itemName': itemName}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch image data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching image data: $e');
    }
  }

  Future<Map<String, dynamic>> getImageData(String itemName) async {
    return await _fetchImageData(itemName);
  }
}
