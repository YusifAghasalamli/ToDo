import 'package:get_it/get_it.dart';
import 'package:todo2/blocs/album_bloc/album_bloc.dart';
import 'package:todo2/blocs/image_bloc/image_bloc.dart';

import 'package:todo2/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo2/data/repositories/album_res.repository.dart';
import 'package:todo2/data/repositories/image_res_repository.dart';
import 'package:todo2/data/repositories/todo_req_repository.dart';
import 'package:todo2/data/services/album_res_service.dart';
import 'package:todo2/data/services/image_res_service.dart';
import 'package:todo2/data/services/todo_req_service.dart';
import 'package:todo2/data/services/todo_res_service.dart';
import 'package:todo2/data/repositories/todo_res_repository.dart';

var locator = GetIt.I;

void setUpLocator() {
  locator.registerLazySingleton<TodoResService>(() => TodoResService());
  locator.registerLazySingleton<TodoReqService>(() => TodoReqService());
  locator.registerLazySingleton<AlbumResService>(() => AlbumResService());
  locator.registerLazySingleton<ImageResService>(() => ImageResService());

  locator.registerLazySingleton(
      () => TodoResRepository(locator.get<TodoResService>()));
  locator.registerLazySingleton(
      () => TodoReqRepository(locator.get<TodoReqService>()));
  locator.registerLazySingleton(
      () => AlbumResRepository(locator.get<AlbumResService>()));

  locator.registerLazySingleton(
      () => ImageResRepository(locator.get<ImageResService>()));

  locator.registerLazySingleton(() => TodoBloc(
        locator.get<TodoResRepository>(),
        locator.get<TodoReqRepository>(),
      ));

  locator.registerLazySingleton(
      () => AlbumBloc(locator.get<AlbumResRepository>()));
  locator.registerLazySingleton(
      () => ImageBloc(locator.get<ImageResRepository>()));
}
