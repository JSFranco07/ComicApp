import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:get/get.dart';

/// Middleware to detail comic
class DetailComicMiddleware extends GetMiddleware {
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Get.find<DetailComicController>().getDetailComic();
    return page;
  }
}
