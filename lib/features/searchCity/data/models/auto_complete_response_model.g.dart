// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_complete_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoCompleteResponseModel _$AutoCompleteResponseModelFromJson(
        Map<String, dynamic> json) =>
    AutoCompleteResponseModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AutoCompleteResponseModelToJson(
        AutoCompleteResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status': instance.status,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      annotations:
          Annotations.fromJson(json['annotations'] as Map<String, dynamic>),
      formatted: json['formatted'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'annotations': instance.annotations,
      'formatted': instance.formatted,
      'geometry': instance.geometry,
    };

Annotations _$AnnotationsFromJson(Map<String, dynamic> json) => Annotations(
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$AnnotationsToJson(Annotations instance) =>
    <String, dynamic>{
      'flag': instance.flag,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
