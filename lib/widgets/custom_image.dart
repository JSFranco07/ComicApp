import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_tech/utils/utils.dart';
import 'package:flutter/material.dart';

/// Widget to load assets images
class CustomImageAsset extends StatelessWidget {
  /// Constructor
  const CustomImageAsset({
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.color,
    Key? key,
  }) : super(key: key);

  /// Image route
  final String image;

  /// Height
  final double? height;

  /// Width
  final double? width;

  /// Fit image
  final BoxFit? fit;

  /// Color image
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.asset(
      image,
      height: height != null
          ? CalculatedSize.calculatedHeight(height!, size.height)
          : 0,
      width: width != null
          ? CalculatedSize.calculatedWidth(
              width!,
              size.width,
            )
          : 0,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }
}

/// Widget to load network images
class CustomImageNetwork extends StatelessWidget {
  /// Constructor
  const CustomImageNetwork({
    required this.url,
    this.height,
    this.width,
    this.fit,
    this.color,
    Key? key,
  }) : super(key: key);

  /// Url
  final String url;

  /// Height
  final double? height;

  /// Width
  final double? width;

  /// Fit
  final BoxFit? fit;

  /// Color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      height: height != null
          ? CalculatedSize.calculatedHeight(height!, size.height)
          : 0,
      width: width != null
          ? CalculatedSize.calculatedWidth(
              width!,
              size.width,
            )
          : 0,
      fit: fit ?? BoxFit.contain,
      errorWidget: (_, error, value) => CircleAvatar(
        child: CustomImageAsset(
          image: 'assets/images/no_image.jpeg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
        ),
      ),
      color: color,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      imageUrl: url,
    );
  }
}
