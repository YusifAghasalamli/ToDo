import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/data/models/album.dart';
import 'package:todo2/data/repositories/album_res.repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumResRepository _resRepository;

  AlbumBloc(this._resRepository) : super(AlbumInitial()) {
    on<FetchAlbums>(fetchAlbums);
  }

  FutureOr<void> fetchAlbums(
      FetchAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());

    try {
      final album = await _resRepository.fetchAlbums();
      emit(AlbumLoaded(album));
    } catch (e) {
      emit(AlbumError('Failed to load todos'));
    }
  }
}
