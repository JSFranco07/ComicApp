import 'dart:convert';

import 'package:comic_tech/comic/comic.dart';

DetailComicModel detailComicModelFromJson(String str) =>
    DetailComicModel.fromJson(json.decode(str));

String detailComicModelToJson(DetailComicModel data) =>
    json.encode(data.toJson());

class DetailComicModel {
  DetailComicModel({
    this.aliases,
    this.apiDetailUrl,
    this.associatedImages,
    this.characterCredits,
    this.characterDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryarcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.locationCredits,
    this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamDisbandedIn,
    this.volume,
  });
  factory DetailComicModel.fromJson(Map<String, dynamic> json) =>
      DetailComicModel(
        aliases: json['aliases'],
        apiDetailUrl: json['api_detail_url'],
        associatedImages: json['associated_images'] == null
            ? null
            : List<AssociatedImageModel>.from(
                json['associated_images']
                    .map((x) => AssociatedImageModel.fromJson(x)),
              ),
        characterCredits: json['character_credits'] == null
            ? null
            : List<VolumeModel>.from(
                json['character_credits'].map((x) => VolumeModel.fromJson(x)),
              ),
        characterDiedIn: json['character_died_in'] == null
            ? null
            : List<dynamic>.from(json['character_died_in'].map((x) => x)),
        conceptCredits: json['concept_credits'] == null
            ? null
            : List<VolumeModel>.from(
                json['concept_credits'].map((x) => VolumeModel.fromJson(x)),
              ),
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
        firstAppearanceCharacters: json['first_appearance_characters'],
        firstAppearanceConcepts: json['first_appearance_concepts'],
        firstAppearanceLocations: json['first_appearance_locations'],
        firstAppearanceObjects: json['first_appearance_objects'],
        firstAppearanceStoryarcs: json['first_appearance_storyarcs'],
        firstAppearanceTeams: json['first_appearance_teams'],
        hasStaffReview: json['has_staff_review'],
        id: json['id'],
        image:
            json['image'] == null ? null : ImageModel.fromJson(json['image']),
        issueNumber: json['issue_number'],
        locationCredits: json['location_credits'] == null
            ? null
            : List<VolumeModel>.from(
                json['location_credits'].map((x) => VolumeModel.fromJson(x)),
              ),
        name: json['name'],
        objectCredits: json['object_credits'] == null
            ? null
            : List<dynamic>.from(json['object_credits'].map((x) => x)),
        personCredits: json['person_credits'] == null
            ? null
            : List<VolumeModel>.from(
                json['person_credits'].map((x) => VolumeModel.fromJson(x)),
              ),
        siteDetailUrl: json['site_detail_url'],
        storeDate: json['store_date'],
        storyArcCredits: json['story_arc_credits'] == null
            ? null
            : List<dynamic>.from(json['story_arc_credits'].map((x) => x)),
        teamCredits: json['team_credits'] == null
            ? null
            : List<dynamic>.from(json['team_credits'].map((x) => x)),
        teamDisbandedIn: json['team_disbanded_in'] == null
            ? null
            : List<dynamic>.from(json['team_disbanded_in'].map((x) => x)),
        volume: json['volume'] == null
            ? null
            : VolumeModel.fromJson(json['volume']),
      );

  /// Método fromMap para un listado de tipos de checklist
  static List<DetailComicModel> listFromJson(list) =>
      List<DetailComicModel>.from(
        list.map(
          (x) => DetailComicModel.fromJson(x),
        ),
      );

  final dynamic aliases;
  final String? apiDetailUrl;
  final List<AssociatedImageModel>? associatedImages;
  final List<VolumeModel>? characterCredits;
  final List<dynamic>? characterDiedIn;
  final List<VolumeModel>? conceptCredits;
  final DateTime? coverDate;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final dynamic deck;
  final String? description;
  final dynamic firstAppearanceCharacters;
  final dynamic firstAppearanceConcepts;
  final dynamic firstAppearanceLocations;
  final dynamic firstAppearanceObjects;
  final dynamic firstAppearanceStoryarcs;
  final dynamic firstAppearanceTeams;
  final bool? hasStaffReview;
  final int? id;
  final ImageModel? image;
  final String? issueNumber;
  final List<VolumeModel>? locationCredits;
  final String? name;
  final List<dynamic>? objectCredits;
  final List<VolumeModel>? personCredits;
  final String? siteDetailUrl;
  final dynamic storeDate;
  final List<dynamic>? storyArcCredits;
  final List<dynamic>? teamCredits;
  final List<dynamic>? teamDisbandedIn;
  final VolumeModel? volume;

  Map<String, dynamic> toJson() => {
        'aliases': aliases,
        'api_detail_url': apiDetailUrl,
        'associated_images': associatedImages == null
            ? null
            : List<dynamic>.from(associatedImages!.map((x) => x.toJson())),
        'character_credits': characterCredits == null
            ? null
            : List<dynamic>.from(characterCredits!.map((x) => x.toJson())),
        'character_died_in': characterDiedIn == null
            ? null
            : List<dynamic>.from(characterDiedIn!.map((x) => x)),
        'concept_credits': conceptCredits == null
            ? null
            : List<dynamic>.from(conceptCredits!.map((x) => x.toJson())),
        'cover_date': coverDate == null
            ? null
            : '${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}',
        'date_added': dateAdded == null ? null : dateAdded!.toIso8601String(),
        'date_last_updated':
            dateLastUpdated == null ? null : dateLastUpdated!.toIso8601String(),
        'deck': deck,
        'description': description,
        'first_appearance_characters': firstAppearanceCharacters,
        'first_appearance_concepts': firstAppearanceConcepts,
        'first_appearance_locations': firstAppearanceLocations,
        'first_appearance_objects': firstAppearanceObjects,
        'first_appearance_storyarcs': firstAppearanceStoryarcs,
        'first_appearance_teams': firstAppearanceTeams,
        'has_staff_review': hasStaffReview,
        'id': id,
        'image': image == null ? null : image!.toJson(),
        'issue_number': issueNumber,
        'location_credits': locationCredits == null
            ? null
            : List<dynamic>.from(locationCredits!.map((x) => x.toJson())),
        'name': name,
        'object_credits': objectCredits == null
            ? null
            : List<dynamic>.from(objectCredits!.map((x) => x)),
        'person_credits': personCredits == null
            ? null
            : List<dynamic>.from(personCredits!.map((x) => x.toJson())),
        'site_detail_url': siteDetailUrl,
        'store_date': storeDate,
        'story_arc_credits': storyArcCredits == null
            ? null
            : List<dynamic>.from(storyArcCredits!.map((x) => x)),
        'team_credits': teamCredits == null
            ? null
            : List<dynamic>.from(teamCredits!.map((x) => x)),
        'team_disbanded_in': teamDisbandedIn == null
            ? null
            : List<dynamic>.from(teamDisbandedIn!.map((x) => x)),
        'volume': volume == null ? null : volume!.toJson(),
      };
}
