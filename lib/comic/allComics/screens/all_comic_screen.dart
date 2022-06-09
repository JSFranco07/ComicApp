import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:comic_tech/routes/routes.dart';
import 'package:comic_tech/utils/date_format.dart';
import 'package:comic_tech/utils/utils.dart';
import 'package:comic_tech/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Screen to all comics
class AllComicsScreen extends GetView<AllComicsController> {
  /// Constructor
  const AllComicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        actions: const [
          _SelectView(isList: true),
          _SelectView(isList: false),
        ],
      ),
      body: controller.obx(
        (state) => Obx(
          () => controller.selectViewList
              ? _ListComic(allComics: state!)
              : _GridComic(allComics: state!),
        ),
        onLoading: const LoadingData(text: 'Loading Comics'),
        onError: (error) => ErrorText(error: error!),
      ),
    );
  }
}

class _SelectView extends GetView<AllComicsController> {
  const _SelectView({
    required this.isList,
    Key? key,
  }) : super(key: key);

  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        onPressed: () => controller.selectViewList = isList,
        icon: Icon(isList ? Icons.view_list : Icons.grid_view),
        color: (isList && controller.selectViewList ||
                (!isList && !controller.selectViewList))
            ? Colors.white
            : Colors.white.withOpacity(0.5),
      ),
    );
  }
}

class _ListComic extends StatelessWidget {
  const _ListComic({required this.allComics, Key? key}) : super(key: key);

  final List<AllComicsModel> allComics;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.all(size.height * 0.02),
      shrinkWrap: true,
      children: allComics.map((comic) => _CardListComic(comic: comic)).toList(),
    );
  }
}

class _CardListComic extends GetView<AllComicsController> {
  const _CardListComic({
    Key? key,
    required this.comic,
  }) : super(key: key);

  final AllComicsModel comic;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CustomCard(
          onTap: () {
            if (Get.find<ConnectivityController>().validateConnection(
              context: context,
            )) {
              controller.selectComic = comic;
              Get.toNamed(Routes.detailComic);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                child: CustomImageNetwork(
                  url: comic.image!.originalUrl!,
                  height: size.height * 0.3,
                  width: size.width * 0.4,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: SizedBox(
                          width: size.width * 0.5,
                          child: Text(
                            comic.name != null
                                ? '${comic.name} #${comic.issueNumber}'
                                : 'Name not available #${comic.issueNumber}',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: SizedBox(
                          width: size.width * 0.25,
                          child: Text(
                            dateFormat(comic.dateAdded!),
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
      ],
    );
  }
}

class _GridComic extends StatelessWidget {
  const _GridComic({required this.allComics, Key? key}) : super(key: key);

  final List<AllComicsModel> allComics;

  @override
  Widget build(BuildContext context) {
    final length = ((allComics.length % 2) + allComics.length) ~/ 2;

    final size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: EdgeInsets.all(size.height * 0.02),
      physics: const BouncingScrollPhysics(),
      itemCount: length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                _CardGridComic(comic: allComics[2 * index]),
                SizedBox(width: size.width * 0.05),
                if (length == 1 && allComics.length != 2)
                  Expanded(child: Container()),
                if (_isPar(allComics.length) || (index != length - 1))
                  _CardGridComic(comic: allComics[(2 * index) + 1]),
                if (_isPar(allComics.length) &&
                    index == length - 1 &&
                    length != 1)
                  Expanded(child: Container()),
              ],
            ),
            SizedBox(height: size.height * 0.02),
          ],
        );
      },
    );
  }

  bool _isPar(int number) {
    if (number % 2 == 0) {
      return true;
    }
    return false;
  }
}

class _CardGridComic extends GetView<AllComicsController> {
  const _CardGridComic({
    required this.comic,
    Key? key,
  }) : super(key: key);

  final AllComicsModel comic;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: CustomCard(
        onTap: () {
          if (Get.find<ConnectivityController>().validateConnection(
            context: context,
          )) {
            controller.selectComic = comic;
            Get.toNamed(Routes.detailComic);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: CustomImageNetwork(
                url: comic.image!.originalUrl!,
                height: size.height * 0.3,
                width: size.width * 0.5,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.02),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      comic.name != null
                          ? '${comic.name} #${comic.issueNumber}'
                          : 'Name not available #${comic.issueNumber}',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      dateFormat(
                        comic.dateAdded!,
                      ),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
