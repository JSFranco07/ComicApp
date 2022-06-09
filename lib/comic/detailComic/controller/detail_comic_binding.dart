import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:get/get.dart';

/// Binding to init detail comic controller
class DetailComicBinding implements Bindings {
  @override
  void dependencies() {
    final DetailComicService service = DetailComicService();
    Get.put<DetailComicController>(
      DetailComicController(service: service),
    );
  }
}
