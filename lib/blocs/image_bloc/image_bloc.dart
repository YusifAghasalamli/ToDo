import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo2/data/models/image.dart';
import 'package:todo2/data/repositories/image_res_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageResRepository _imageResRepository;
  ImageBloc(this._imageResRepository) : super(ImageInitial()) {
    on<FetchImages>(fetchImages);
  }

  FutureOr<void> fetchImages(
      FetchImages event, Emitter<ImageState> emit) async {
    emit(ImageLoading());

    try {
      final images = await _imageResRepository.fetchImages(event.id);
      emit(ImageLoaded(images));
    } catch (e) {
      emit(ImageError('Failed to load images'));
    }
  }
}
