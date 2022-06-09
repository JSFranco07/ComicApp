import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:get/get.dart';

/// Binding to init all comics controller
class AllComicsBinding implements Bindings {
  @override
  void dependencies() {
    final AllComicsService service = AllComicsService();
    Get.put<AllComicsController>(
      AllComicsController(service: service),
    );
  }
}
