import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo2/constants/api_keys.dart';

class AlbumResService {
  Future<List<dynamic>> fetchAlbums() async {
    final response = await http.get(Uri.parse(ApiKeys.albums));
    if (response.statusCode == 200) {
      final albumsData = json.decode(response.body) as List<dynamic>;
      return albumsData;
    } else {
      throw Exception('Failed to fetch todos');
    }
  }
}
