/// Model to volume
class VolumeModel {
  /// Method fromJson
  factory VolumeModel.fromJson(Map<String, dynamic> json) => VolumeModel(
        apiDetailUrl: json['api_detail_url'],
        id: json['id'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
        role: json['role'],
      );

  /// Constructor
  VolumeModel({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
    this.role,
  });

  /// Url access to volume detail
  final String? apiDetailUrl;

  /// Id volume
  final int? id;

  /// Volume name
  final String? name;

  /// Url access to site detail volume
  final String? siteDetailUrl;

  /// Volume role
  final String? role;

  /// Method toJson
  Map<String, dynamic> toJson() => {
        'api_detail_url': apiDetailUrl,
        'id': id,
        'name': name,
        'site_detail_url': siteDetailUrl,
        'role': role,
      };
}
