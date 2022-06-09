import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
)

/// Class to serializable to API response
class BaseResponse<T> {
  /// Constructor
  BaseResponse(
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  );

  /// Parse to Api response
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  /// A text string representing the status_code
  @JsonKey(name: 'error')
  final String error;

  /// The value of the limit filter specified, or 100 if not specified
  @JsonKey(name: 'limit')
  final int? limit;

  /// The value of the offset filter specified, or 0 if not specified
  @JsonKey(name: 'offset')
  final int? offset;

  /// The number of results on this page
  @JsonKey(name: 'number_of_page_results')
  final int? numberOfPageResults;

  /// The number of total results matching the filter conditions specified
  @JsonKey(name: 'number_of_total_results')
  final int? numberOfTotalResults;

  /// Request status
  @JsonKey(name: 'status_code')
  final int? statusCode;

  /// Zero or more items that match the filters specified
  @JsonKey(name: 'results')
  final T? results;

  /// Version
  @JsonKey(name: 'version')
  final String? version;

  /// Method toJson
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
