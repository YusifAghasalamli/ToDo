import 'package:todo2/data/models/image.dart';
import 'package:todo2/data/services/image_res_service.dart';

class ImageResRepository {
  final ImageResService _apiService;

  ImageResRepository(this._apiService);

  Future<List<ImageItem>> fetchImages(int id) async {
    final imagesData = await _apiService.fetchImages(id);
    final images = imagesData.map<ImageItem>((data) {
      return ImageItem.fromJson(data);
    }).toList();
    return images;
  }
}
