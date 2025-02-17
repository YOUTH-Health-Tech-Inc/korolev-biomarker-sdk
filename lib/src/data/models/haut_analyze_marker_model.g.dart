// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haut_analyze_marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HautAnalyzeMarkerModel _$HautAnalyzeMarkerModelFromJson(
        Map<String, dynamic> json) =>
    HautAnalyzeMarkerModel(
      json['biomarker_name'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$HautAnalyzeMarkerModelToJson(
        HautAnalyzeMarkerModel instance) =>
    <String, dynamic>{
      'biomarker_name': instance.name,
      'value': instance.value,
    };
