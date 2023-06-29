import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imageUrl;
  const ImageScreen({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Hero(
          tag: imageUrl, // Unique tag for the hero animation
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
