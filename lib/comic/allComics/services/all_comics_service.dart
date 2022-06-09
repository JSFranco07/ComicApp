import 'package:comic_tech/api/api.dart';
import 'package:comic_tech/comic/allComics/all_comics.dart';

/// Service to call API
class AllComicsService {
  /// Service to load all comics
  Future<BaseResponse<List<AllComicsModel>>?> getAllComics() async {
    try {
      final response = await ApiRequest.get(
        'http://comicvine.gamespot.com/api/issues/',
      );
      BaseResponse<List<AllComicsModel>> res =
          BaseResponse<List<AllComicsModel>>.fromJson(
        response,
        (data) => AllComicsModel.listFromJson(data),
      );
      return res;
    } catch (e) {
      return null;
    }
  }
}
