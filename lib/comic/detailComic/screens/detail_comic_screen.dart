import 'package:comic_tech/comic/comic.dart';
import 'package:comic_tech/comic/detailComic/detail_comic.dart';
import 'package:comic_tech/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Screen to detail comic
class DetailComicScreen extends GetView<DetailComicController> {
  /// Constructor
  const DetailComicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(context: context),
      body: controller.obx(
        (state) => Column(
          children: [
            CustomImageNetwork(
              url: state!.image!.originalUrl!,
              height: size.height * 0.45,
              width: size.width,
              fit: BoxFit.fill,
            ),
            _VolumeData(comic: state),
          ],
        ),
        onLoading: const LoadingData(text: 'Loading Comic Data'),
        onError: (error) => ErrorText(error: error!),
      ),
    );
  }
}

class _VolumeData extends StatelessWidget {
  const _VolumeData({
    required this.comic,
    Key? key,
  }) : super(key: key);

  final DetailComicModel comic;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: size.height * 0.025),
              if (comic.characterCredits!.isNotEmpty)
                _DetailVolume(
                  title: 'Characters',
                  list: comic.characterCredits!,
                  position: 1,
                ),
              if (comic.teamCredits!.isNotEmpty)
                _DetailVolume(
                  title: 'Team',
                  list: comic.teamCredits!,
                  position: 2,
                ),
              if (comic.locationCredits!.isNotEmpty)
                _DetailVolume(
                  title: 'Location',
                  list: comic.locationCredits!,
                  position: 3,
                ),
              if (comic.characterCredits!.isEmpty &&
                  comic.teamCredits!.isEmpty &&
                  comic.locationCredits!.isEmpty)
                CustomTextBox(
                  width: size.width * 0.8,
                  text: 'There is no information for this comic',
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailVolume extends GetView<DetailComicController> {
  const _DetailVolume({
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
