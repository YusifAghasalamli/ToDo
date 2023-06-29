import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/album_bloc/album_bloc.dart';
import 'package:todo2/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo2/screens/home_screen.dart';
import 'package:todo2/screens/album_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AlbumsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
      if (_selectedTabIndex == 0) {
        context.read<TodoBloc>().add(LoadTodos());
      }
      if (_selectedTabIndex == 1) {
        context.read<AlbumBloc>().add(FetchAlbums());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Albums',
          ),
        ],
      ),
    );
  }
}
