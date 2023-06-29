import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo2/constants/api_keys.dart';
import 'package:todo2/data/models/todo.dart';

class TodoReqService {
  Future<void> createTodo(String title) async {
    final url = Uri.parse(ApiKeys.todos);
    // final headers = {'Content-Type': 'application/json'};
    final body = json.encode(
        Todo(userId: 12, id: 123243, title: title, completed: false).toJson());
    final response = await http.post(url, body: body);

    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to create todo');
    }
  }
}
