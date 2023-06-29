import 'package:flutter/material.dart';
import 'package:todo2/screens/image_screen.dart';

class ImageCardWidget extends StatelessWidget {
  // final String imageThumbUrl;
  final String title;
  final String imageUrl;

  const ImageCardWidget(
      {super.key,
      // required this.imageThumbUrl,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageScreen(imageUrl: imageUrl),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Hero(
                tag: imageUrl,
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
