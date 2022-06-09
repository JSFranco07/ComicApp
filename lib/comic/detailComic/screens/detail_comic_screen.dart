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
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              child: CustomImageNetwork(
                url: state!.image!.originalUrl!,
                height: size.height * 0.4,
                width: size.width * 0.35,
                fit: BoxFit.fill,
              ),
            ),
            const Text('Characters'),
            ListView(
              shrinkWrap: true,
              children: state.characterCredits!
                  .map(
                    (character) => Column(
                      children: [
                        Text(character.name!),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const Text('Team'),
            ListView(
              shrinkWrap: true,
              children: state.teamCredits!
                  .map(
                    (character) => Column(
                      children: [
                        Text(character.name!),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const Text('Location'),
            ListView(
              shrinkWrap: true,
              children: state.locationCredits!
                  .map(
                    (character) => Column(
                      children: [
                        Text(character.name!),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const Text('Concept'),
            ListView(
              shrinkWrap: true,
              children: state.conceptCredits!
                  .map(
                    (character) => Column(
                      children: [
                        Text(character.name!),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Text(state.volume!.name!),
          ],
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
