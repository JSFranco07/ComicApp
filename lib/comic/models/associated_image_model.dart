/// Model to associated image
class AssociatedImageModel {
  /// Method fromJson
  factory AssociatedImageModel.fromJson(Map<String, dynamic> json) =>
      AssociatedImageModel(
        originalUrl: json['original_url'],
        id: json['id'],
        caption: json['caption'],
        imageTags: json['image_tags'],
      );

  /// Constructor
  AssociatedImageModel({
    this.originalUrl,
    this.id,
    this.caption,
    this.imageTags,
  });

  /// Original url
  final String? originalUrl;

  /// Id
  final int? id;

  /// caption
  final dynamic caption;

  /// Image tags
  final String? imageTags;

  /// Method toJson
  Map<String, dynamic> toJson() => {
        'original_url': originalUrl,
        'id': id,
        'caption': caption,
        'image_tags': imageTags,
      };
}
