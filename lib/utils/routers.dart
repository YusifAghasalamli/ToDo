import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/album_bloc/album_bloc.dart';
import 'package:todo2/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo2/locator.dart';
import 'package:todo2/screens/album_screen.dart';
import 'package:todo2/screens/home_screen.dart';
// import 'package:todo2/screens/tabs_screen.dart';
import 'package:todo2/screens/todo_add_screen.dart';

import '../constants/routes.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.tabs:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.add:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: ((context) => locator.get<TodoBloc>()),
            child: TodoAddScreen(),
          ),
        );
      case AppRoutes.albums:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: ((context) => locator.get<AlbumBloc>()),
            child: const AlbumsScreen(),
          ),
        );

      default:
        throw Exception("Unimplemented routes");
    }
  }
}
      // builder: (_) => MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //               create: (context) => CommentListCubit()
      //                 ..getCommentListData((settings.arguments
      //                     as Map<String, dynamic>)["id"])),
      //           BlocProvider(
      //               create: (context) => PostCubit()
      //                 ..getPostData((settings.arguments
      //                     as Map<String, dynamic>)["id"])),
      //         ],
      //         child: PostDetailScreen(
      //             (settings.arguments as Map<String, dynamic>)["id"])));