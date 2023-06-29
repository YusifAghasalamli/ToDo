import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/album_bloc/album_bloc.dart';
import 'package:todo2/blocs/image_bloc/image_bloc.dart';
import 'package:todo2/data/models/album.dart';
import 'package:todo2/screens/images_screen.dart';
import 'package:todo2/locator.dart';

class AlbumCards extends StatelessWidget {
  final List<Album> albums;

  AlbumCards({super.key, required this.albums});
  final imageBloc = locator.get<ImageBloc>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: albums.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final album = albums[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<ImageBloc>.value(
                    value: imageBloc, // Pass the existing ImageBloc instance
                    child: ImagesScreen(album.id),
                  ),
                ),
              ).then((value) => context.read<AlbumBloc>().add(FetchAlbums()));
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.blue.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    album.title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
