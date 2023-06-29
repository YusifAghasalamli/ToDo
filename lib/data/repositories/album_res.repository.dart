import 'package:todo2/data/models/album.dart';
import 'package:todo2/data/services/album_res_service.dart';

class AlbumResRepository {
  final AlbumResService _apiService;

  AlbumResRepository(this._apiService);

  Future<List<Album>> fetchAlbums() async {
    final todoData = await _apiService.fetchAlbums();
    final todos = todoData.map<Album>((data) {
      return Album.fromJson(data);
    }).toList();
    return todos;
  }
}
