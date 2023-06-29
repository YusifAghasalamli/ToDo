import 'package:todo2/data/models/todo.dart';
import 'package:todo2/data/services/todo_res_service.dart';

class TodoResRepository {
  final TodoResService _apiService;

  TodoResRepository(this._apiService);

  Future<List<Todo>> getTodos() async {
    final todoData = await _apiService.fetchTodos();

    final todos = todoData.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
    return todos;
  }
}
