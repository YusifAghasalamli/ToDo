import 'package:flutter/widgets.dart';
import 'package:todo2/data/models/image.dart';
import 'package:todo2/widgets/image_card.dart';

class ImageViewBuilder extends StatelessWidget {
  final List<ImageItem> images;
  const ImageViewBuilder(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        var image = images[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ImageCardWidget(
            imageUrl: image.url,
            title: image.title,
            // imageThumbUrl: image.thumbnailUrl,
          ),
        );
      },
    );
  }
}
