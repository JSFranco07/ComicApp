import 'package:comic_tech/comic/allComics/all_comics.dart';
import 'package:comic_tech/routes/routes.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comic Book'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView(
          padding: EdgeInsets.all(
            CalculatedSize.calculatedHeight(size.height * 0.02, size.height),
          ),
          shrinkWrap: true,
          children: state!
              .map(
                (comic) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (Get.find<ConnectivityController>()
                            .validateConnection(
                          context: context,
                        )) {
                          controller.selectComic = comic;
                          Get.toNamed(Routes.detailComic);
                        }
                      },
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.zero,
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
                                width: size.width * 0.35,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(comic.dateAdded!.toIso8601String()),
                                  Text(
                                    comic.volume!.name != null
                                        ? '${comic.volume!.name} #${comic.issueNumber}'
                                        : 'Name not available #${comic.issueNumber}',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    )
                  ],
                ),
              )
              .toList(),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Center(
          child: Text(error!),
        ),
      ),
    );
  }
}
