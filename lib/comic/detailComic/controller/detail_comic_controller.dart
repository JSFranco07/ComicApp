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

  final RxList<String> _charactersImages = [''].obs;

  /// List to characters images
  List<String> get charactersImages =>
      _charactersImages.map((element) => element).toList();
  set charactersImages(List<String> value) => _charactersImages.value = value;

  final RxList<String> _locationImages = [''].obs;

  /// List to location images
  List<String> get locationImages =>
      _locationImages.map((element) => element).toList();
  set locationImages(List<String> value) => _locationImages.value = value;

  final RxList<String> _teamsImages = [''].obs;

  /// List to temas images
  List<String> get teamsImages =>
      _teamsImages.map((element) => element).toList();
  set teamsImages(List<String> value) => _teamsImages.value = value;

  /// Get detail to select comic
  Future<void> getDetailComic() async {
    charactersImages = [];
    final response = await service.getDetailComic();
    if (response != null) {
      if (response.statusCode == 1) {
        for (var i = 0; i < response.results!.characterCredits!.length; i++) {
          final character = await _getDetailImage(
            response.results!.characterCredits![i].apiDetailUrl!,
          );
          charactersImages = [...charactersImages, character];
        }
        for (var i = 0; i < response.results!.teamCredits!.length; i++) {
          final character = await _getDetailImage(
            response.results!.teamCredits![i].apiDetailUrl!,
          );
          teamsImages = [...teamsImages, character];
        }
        for (var i = 0; i < response.results!.locationCredits!.length; i++) {
          final character = await _getDetailImage(
            response.results!.locationCredits![i].apiDetailUrl!,
          );
          locationImages = [...locationImages, character];
        }
        change(response.results, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(response.error));
      }
    } else {
      change(
        null,
        status: RxStatus.error(
          'An unexpected error occurred, please check your Internet connection and try again later',
        ),
      );
    }
  }

  /// Get images
  Future<String> _getDetailImage(String url) async {
    final response = await service.getDetailImage(url);
    if (response != null && response.statusCode == 1) {
      return response.results!['image']['original_url'].toString();
    } else {
      return '';
    }
  }
}
