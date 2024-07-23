import 'package:json_annotation/json_annotation.dart';
part 'auto_complete_response_model.g.dart';

@JsonSerializable()
class AutoCompleteResponseModel {
  final List<Result> results;
  final Status status;

  AutoCompleteResponseModel({
    required this.results,
    required this.status,
  });
  /// factory.
  factory AutoCompleteResponseModel.fromJson(Map<String, dynamic> json) => _$AutoCompleteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoCompleteResponseModelToJson(this);

}
@JsonSerializable()
class Result {
  final Annotations annotations;
  final String formatted;
  final Geometry geometry;

  Result({
    required this.annotations,
    required this.formatted,
    required this.geometry,
  });
  /// factory.
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}
@JsonSerializable()
class Annotations {
  final String flag;

  Annotations({

    required this.flag,

  });
  /// factory.
  factory Annotations.fromJson(Map<String, dynamic> json) => _$AnnotationsFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationsToJson(this);

}
@JsonSerializable()
class Geometry {
  final double lat;
  final double lng;

  Geometry({
    required this.lat,
    required this.lng,
  });
  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);

}
@JsonSerializable()
class Status {
  final int code;
  final String message;

  Status({
    required this.code,
    required this.message,
  });
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

}