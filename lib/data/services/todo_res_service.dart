import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todo2/constants/api_keys.dart';

class TodoResService {
  Future<List<dynamic>> fetchTodos() async {
    final response = await http.get(Uri.parse(ApiKeys.todos));
    if (response.statusCode == 200) {
      final todosData = json.decode(response.body) as List<dynamic>;
      return todosData;
    } else {
      throw Exception('Failed to fetch todos');
    }
  }
}
