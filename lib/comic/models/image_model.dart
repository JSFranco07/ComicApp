/// Model to image
class ImageModel {
  /// Method fromJson
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        iconUrl: json['icon_url'],
        mediumUrl: json['medium_url'],
        screenUrl: json['screen_url'],
        screenLargeUrl: json['screen_large_url'],
        smallUrl: json['small_url'],
        superUrl: json['super_url'],
        thumbUrl: json['thumb_url'],
        tinyUrl: json['tiny_url'],
        originalUrl: json['original_url'],
        imageTags: json['image_tags'],
      );

  /// Constructor
  ImageModel({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  /// Icon url
  final String? iconUrl;

  /// Medium url
  final String? mediumUrl;

  /// Screen url
  final String? screenUrl;

  /// Screen large url
  final String? screenLargeUrl;

  /// Small url
  final String? smallUrl;

  /// Super url
  final String? superUrl;

  /// Thumb url
  final String? thumbUrl;

  /// Tiny url
  final String? tinyUrl;

  /// Original url
  final String? originalUrl;

  /// Images tags
  final String? imageTags;

  /// Method toJson
  Map<String, dynamic> toJson() => {
        'icon_url': iconUrl,
        'medium_url': mediumUrl,
        'screen_url': screenUrl,
        'screen_large_url': screenLargeUrl,
        'small_url': smallUrl,
        'super_url': superUrl,
        'thumb_url': thumbUrl,
        'tiny_url': tinyUrl,
        'original_url': originalUrl,
        'image_tags': imageTags,
      };
}
