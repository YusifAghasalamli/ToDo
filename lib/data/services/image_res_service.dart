import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo2/constants/api_keys.dart';

class ImageResService {
  Future<List<dynamic>> fetchImages(int id) async {
    final response = await http.get(Uri.parse("${ApiKeys.images}?albumId=$id"));
    if (response.statusCode == 200) {
      final imagesData = json.decode(response.body) as List<dynamic>;
      return imagesData;
    } else {
      throw Exception('Failed to fetch images');
    }
  }
}
