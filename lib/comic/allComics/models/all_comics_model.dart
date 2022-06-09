import 'dart:convert';

import 'package:comic_tech/comic/comic.dart';

AllComicsModel allComicsModelFromJson(String str) =>
    AllComicsModel.fromJson(json.decode(str));

String allComicsModelToJson(AllComicsModel data) => json.encode(data.toJson());

class AllComicsModel {
  AllComicsModel({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.associatedImages,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });
  factory AllComicsModel.fromJson(Map<String, dynamic> json) => AllComicsModel(
        aliases: json['aliases'],
        apiDetailUrl: json['api_detail_url'],
        coverDate: json['cover_date'] == null
            ? null
            : DateTime.parse(json['cover_date']),
        dateAdded: json['date_added'] == null
            ? null
            : DateTime.parse(json['date_added']),
        dateLastUpdated: json['date_last_updated'] == null
            ? null
            : DateTime.parse(json['date_last_updated']),
        deck: json['deck'],
        description: json['description'],
        hasStaffReview: json['has_staff_review'],
        id: json['id'],
        image:
            json['image'] == null ? null : ImageModel.fromJson(json['image']),
        associatedImages: json['associated_images'] == null
            ? null
            : List<AssociatedImageModel>.from(
                json['associated_images']
                    .map((x) => AssociatedImageModel.fromJson(x)),
              ),
        issueNumber: json['issue_number'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
        storeDate: json['store_date'],
        volume: json['volume'] == null
            ? null
            : VolumeModel.fromJson(json['volume']),
      );

  /// Método fromMap para un listado de tipos de checklist
  static List<AllComicsModel> listFromJson(list) => List<AllComicsModel>.from(
        list.map(
          (x) => AllComicsModel.fromJson(x),
        ),
      );

  final dynamic aliases;
  final String? apiDetailUrl;
  final DateTime? coverDate;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final dynamic deck;
  final String? description;
  final bool? hasStaffReview;
  final int? id;
  final ImageModel? image;
  final List<AssociatedImageModel>? associatedImages;
  final String? issueNumber;
  final String? name;
  final String? siteDetailUrl;
  final dynamic storeDate;
  final VolumeModel? volume;

  Map<String, dynamic> toJson() => {
        'aliases': aliases,
        'api_detail_url': apiDetailUrl,
        'cover_date': coverDate == null
            ? null
            : '${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}',
        'date_added': dateAdded == null ? null : dateAdded!.toIso8601String(),
        'date_last_updated':
            dateLastUpdated == null ? null : dateLastUpdated!.toIso8601String(),
        'deck': deck,
        'description': description,
        'has_staff_review': hasStaffReview,
        'id': id,
        'image': image == null ? null : image!.toJson(),
        'associated_images': associatedImages == null
            ? null
            : List<dynamic>.from(associatedImages!.map((x) => x.toJson())),
        'issue_number': issueNumber,
        'name': name,
        'site_detail_url': siteDetailUrl,
        'store_date': storeDate,
        'volume': volume == null ? null : volume!.toJson(),
      };
}
