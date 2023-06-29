part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<ImageItem> images;
  ImageLoaded(this.images);
}

class ImageError extends ImageState {
  final String errorMessage;

  ImageError(this.errorMessage);
}
