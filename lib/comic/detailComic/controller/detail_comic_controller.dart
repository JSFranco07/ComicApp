import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:get/get.dart';

/// Controller to detail comic
class DetailComicController extends GetxController
    with StateMixin<DetailComicModel> {
  /// Constructor
  DetailComicController({required this.service}) {
    change(null, status: RxStatus.loading());
  }

  /// Instance to call service
  final DetailComicService service;

  /// Get detail to select comic
  Future<void> getDetailComic() async {
    final response = await service.getDetailComic();
    if (response.statusCode == 1) {
      change(response.results, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }
}
