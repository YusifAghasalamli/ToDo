part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> album;

  AlbumLoaded(this.album);
}

class AlbumError extends AlbumState {
  final String errorMessage;

  AlbumError(this.errorMessage);
}
