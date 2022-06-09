import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:get/get.dart';

/// Middleware para los tipos de checklist
class AllComicsMiddleware extends GetMiddleware {
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Get.find<AllComicsController>().getAllComics();
    return page;
  }
}
