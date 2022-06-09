import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:get/get.dart';

/// Binding to init AllComicsController
class AllComicsBinding implements Bindings {
  @override
  void dependencies() {
    final AllComicsService service = AllComicsService();
    Get.put<AllComicsController>(
      AllComicsController(service: service),
    );
  }
}
