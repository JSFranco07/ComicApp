import 'package:comic_tech/api/api.dart';
import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:get/get.dart';

/// Service to call API
class DetailComicService {
  /// Load specific comic
  Future<BaseResponse<DetailComicModel>?> getDetailComic() async {
    try {
      final response = await ApiRequest.get(
        Get.find<AllComicsController>().selectComic.apiDetailUrl!,
      );
      BaseResponse<DetailComicModel> res =
          BaseResponse<DetailComicModel>.fromJson(
        response,
        (data) => DetailComicModel.fromJson(data as Map<String, dynamic>),
      );
      return res;
    } catch (e) {
      return null;
    }
  }

  /// Service to load all images in the detail comic
  Future<BaseResponse<Map<String, dynamic>>?> getDetailImage(String url) async {
    try {
      final response = await ApiRequest.get(url);
      BaseResponse<Map<String, dynamic>> res =
          BaseResponse<Map<String, dynamic>>.fromJson(
        response,
        (data) => data as Map<String, dynamic>,
      );
      return res;
    } catch (e) {
      return null;
    }
  }
}
