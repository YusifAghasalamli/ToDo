import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/album_bloc/album_bloc.dart';
import 'package:todo2/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo2/locator.dart';
import 'package:todo2/screens/tabs_screen.dart';

Future<void> main() async {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoBloc>(
            create: (context) => locator.get<TodoBloc>()..add(LoadTodos()),
          ),
          BlocProvider<AlbumBloc>(
              create: (context) => locator.get<AlbumBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo App',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),

          home: const TabsScreen(),
          // onGenerateRoute: (settings) => Routers.generateRoute(settings),
        ));
  }
}
