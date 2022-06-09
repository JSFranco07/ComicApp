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
      appBar: AppBar(
        title: const Text('Comic Book'),
        centerTitle: true,
        actions: const [
          _SelectView(isList: true),
          _SelectView(isList: false),
        ],
      ),
      body: controller.obx(
        (state) => Obx(
          () => controller.selectViewList
              ? const _ListComic()
              : const _GridComic(),
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
    return IconButton(
      onPressed: () => controller.selectViewList = isList,
      icon: Icon(isList ? Icons.view_list : Icons.grid_view),
    );
  }
}

class _ListComic extends GetView<AllComicsController> {
  const _ListComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.all(size.height * 0.02),
      shrinkWrap: true,
      children: controller.state!
          .map(
            (comic) => Column(
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
                                    style:
                                        Theme.of(context).textTheme.headline2,
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
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
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
                )
              ],
            ),
          )
          .toList(),
    );
  }
}

class _GridComic extends GetView<AllComicsController> {
  const _GridComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final length =
        ((controller.state!.length % 2) + controller.state!.length) ~/ 2;

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
                _CardGridComic(index: 2 * index),
                SizedBox(width: size.width * 0.05),
                if (length == 1 && controller.state!.length != 2)
                  Expanded(child: Container()),
                if (_isPar(controller.state!.length) || (index != length - 1))
                  _CardGridComic(index: (2 * index) + 1),
                if (_isPar(controller.state!.length) &&
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
    } else {
      return false;
    }
  }
}

class _CardGridComic extends GetView<AllComicsController> {
  const _CardGridComic({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: CustomCard(
        onTap: () {
          if (Get.find<ConnectivityController>().validateConnection(
            context: context,
          )) {
            controller.selectComic = controller.state![index];
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
                url: controller.state![index].image!.originalUrl!,
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
                      controller.state![index].name != null
                          ? '${controller.state![index].name} #${controller.state![index].issueNumber}'
                          : 'Name not available #${controller.state![index].issueNumber}',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  CustomTextBox(
                    width: size.width * 0.125,
                    text: dateFormat(
                      controller.state![index].dateAdded!,
                    ),
                    style: Theme.of(context).textTheme.subtitle1,
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
