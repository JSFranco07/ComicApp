import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:get/get.dart';

/// Controller to all comics
class AllComicsController extends GetxController
    with StateMixin<List<AllComicsModel>> {
  /// Constructor
  AllComicsController({required this.service}) {
    change([], status: RxStatus.loading());
  }

  /// Instance to call service
  final AllComicsService service;

  final Rx<AllComicsModel> _selectComic = AllComicsModel().obs;

  /// Methods get and set to select comic
  AllComicsModel get selectComic => _selectComic.value;
  set selectComic(AllComicsModel value) => _selectComic.value = value;

  final RxBool _selectViewList = false.obs;

  /// Methods get and set to select view option
  bool get selectViewList => _selectViewList.value;
  set selectViewList(bool value) => _selectViewList.value = value;

  /// Load all comics
  Future<void> getAllComics() async {
    change([], status: RxStatus.loading());
    final response = await service.getAllComics();
    if (response != null) {
      if (response.statusCode == 1) {
        change(response.results, status: RxStatus.success());
      } else {
        change([], status: RxStatus.error(response.error));
      }
    } else {
      change(
        [],
        status: RxStatus.error(
          'An unexpected error occurred, please check your Internet connection and try again later',
        ),
      );
    }
  }
}
