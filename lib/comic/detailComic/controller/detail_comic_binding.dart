import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:get/get.dart';

/// Binding para inicializar controlador de los tipos de checklist
class DetailComicBinding implements Bindings {
  @override
  void dependencies() {
    final DetailComicService service = DetailComicService();
    Get.put<DetailComicController>(
      DetailComicController(service: service),
    );
  }
}
