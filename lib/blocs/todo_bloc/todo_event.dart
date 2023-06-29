part of 'todo_bloc.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class PostTodos extends TodoEvent {
  final String title;
  PostTodos({required this.title});
}
