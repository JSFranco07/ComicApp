import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:comic_tech/routes/routes_name.dart';
import 'package:get/get.dart';

/// Class with all screens to the app
class Pages {
  /// List screens
  static List<GetPage> pages() => [
        GetPage(
          name: Routes.allComics,
          page: () => const AllComicsScreen(),
          binding: AllComicsBinding(),
          middlewares: [
            AllComicsMiddleware(),
          ],
        ),
        GetPage(
          name: Routes.detailComic,
          page: () => const DetailComicScreen(),
          binding: DetailComicBinding(),
          middlewares: [
            DetailComicMiddleware(),
          ],
        ),
      ];
}
