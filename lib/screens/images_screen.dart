import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/image_bloc/image_bloc.dart';
import 'package:todo2/widgets/images_view_builder.dart';

class ImagesScreen extends StatelessWidget {
  final int id;
  const ImagesScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ImageBloc>().add(FetchImages(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ImageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ImageLoaded) {
            return ImageViewBuilder(state.images);
          } else if (state is ImageError) {
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
