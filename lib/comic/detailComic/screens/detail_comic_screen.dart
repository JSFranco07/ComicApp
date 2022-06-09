import 'package:comic_tech/comic/comic.dart';
import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:comic_tech/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Screen to all comics
class DetailComicScreen extends GetView<DetailComicController> {
  /// Constructor
  const DetailComicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comic Book'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Column(
          children: [
            CustomImageNetwork(
              url: state!.image!.originalUrl!,
              height: size.height * 0.45,
              width: size.width,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: size.height * 0.025),
                      if (state.characterCredits!.isNotEmpty)
                        _DetailComic(
                          title: 'Characters',
                          list: state.characterCredits!,
                          position: 1,
                        ),
                      if (state.teamCredits!.isNotEmpty)
                        _DetailComic(
                          title: 'Team',
                          list: state.teamCredits!,
                          position: 2,
                        ),
                      if (state.locationCredits!.isNotEmpty)
                        _DetailComic(
                          title: 'Location',
                          list: state.locationCredits!,
                          position: 3,
                        ),
                      if (state.characterCredits!.isEmpty &&
                          state.teamCredits!.isEmpty &&
                          state.locationCredits!.isEmpty)
                        CustomTextBox(
                          width: size.width * 0.8,
                          text: 'There is no information for this comic',
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        onLoading: const LoadingData(text: 'Loading Comic Data'),
        onError: (error) => ErrorText(error: error!),
      ),
    );
  }
}

class _DetailComic extends GetView<DetailComicController> {
  const _DetailComic({
    required this.title,
    required this.list,
    required this.position,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<VolumeModel> list;
  final int position;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextBox(
          width: size.width * 0.25,
          text: title,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.165,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: list
                .map(
                  (character) => Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: size.height * 0.01),
                          CustomTextBox(
                            width: size.width * 0.11,
                            text: character.name!,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomImageNetwork(
                            url: position == 1
                                ? controller.charactersImages[controller
                                    .state!.characterCredits!
                                    .indexOf(character)]
                                : position == 2
                                    ? controller.teamsImages[controller
                                        .state!.teamCredits!
                                        .indexOf(character)]
                                    : controller.locationImages[controller
                                        .state!.locationCredits!
                                        .indexOf(character)],
                            height: size.height * 0.1,
                            width: size.height * 0.1,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.075,
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: size.height * 0.03)
      ],
    );
  }
}
