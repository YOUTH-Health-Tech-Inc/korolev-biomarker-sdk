// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haut_analyze_marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HautAnalyzeMarkerModel _$HautAnalyzeMarkerModelFromJson(
        Map<String, dynamic> json) =>
    HautAnalyzeMarkerModel(
      json['type'] as String,
      HautAnalyzeValueModel.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HautAnalyzeMarkerModelToJson(
        HautAnalyzeMarkerModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

HautAnalyzeValueModel _$HautAnalyzeValueModelFromJson(
        Map<String, dynamic> json) =>
    HautAnalyzeValueModel(
      json['value'],
    );

Map<String, dynamic> _$HautAnalyzeValueModelToJson(
        HautAnalyzeValueModel instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
