import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/data/models/todo.dart';
import 'package:todo2/data/repositories/todo_req_repository.dart';
import 'package:todo2/data/repositories/todo_res_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoResRepository _resRepository;
  final TodoReqRepository _reqRepository;

  TodoBloc(this._resRepository, this._reqRepository) : super(TodoInitial()) {
    on<LoadTodos>(loadTodos);
    on<PostTodos>(postTodos);
  }

  FutureOr<void> loadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await _resRepository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Failed to load todos'));
    }
  }

  FutureOr<void> postTodos(PostTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await _reqRepository.createTodo(event.title);

      emit(PostedSuccessful());
    } catch (e) {
      emit(TodoError('Failed to load todos'));
    }
  }
}













//   Stream<TodoState> mapEventToState(TodoEvent event) async* {
//     if (event is LoadTodos) {
//       yield* _mapLoadTodosToState();
//     }
//   }

//   Stream<TodoState> _mapLoadTodosToState() async* {
//     yield TodoLoading();
//     try {
//       final todos = await _repository.getTodos();
//       yield TodoLoaded(todos);
//     } catch (e) {
//       yield TodoError('Failed to load todos');
//     }
//   }
// }
