import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:get/get.dart';

/// Binding para inicializar controlador de los tipos de checklist
class AllComicsBinding implements Bindings {
  @override
  void dependencies() {
    final AllComicsService service = AllComicsService();
    Get.put<AllComicsController>(
      AllComicsController(service: service),
    );
  }
}
