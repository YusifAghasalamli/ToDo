import 'package:todo2/data/services/todo_req_service.dart';

class TodoReqRepository {
  final TodoReqService apiService;

  TodoReqRepository(this.apiService);

  Future<void> createTodo(String title) async {
    await apiService.createTodo(title);
  }
}
