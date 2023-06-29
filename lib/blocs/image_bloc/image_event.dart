part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class FetchImages extends ImageEvent {
  final int id;
  FetchImages(this.id);
}
