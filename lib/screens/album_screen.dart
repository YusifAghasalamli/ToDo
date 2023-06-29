import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/album_bloc/album_bloc.dart';
import 'package:todo2/widgets/album_cards.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumLoaded) {
            return AlbumCards(albums: state.album);
          } else if (state is AlbumError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:your_app/models/album.dart';
// import 'package:your_app/widgets/album_cards.dart';

// class AlbumsScreen extends StatelessWidget {
//   final List<Album> albums = [
//     Album(title: 'Album 1'),
//     Album(title: 'Album 2'),
//     Album(title: 'Album 3'),
//     // Add more album data as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Albums'),
//       ),
//       body: AlbumCards(albums: albums),
//     );
//   }
// }
