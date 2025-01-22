// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haut_analyze_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HautAnalyzeModel _$HautAnalyzeModelFromJson(Map<String, dynamic> json) =>
    HautAnalyzeModel(
      (json['data'] as List<dynamic>)
          .map(
              (e) => HautAnalyzeMarkerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HautAnalyzeModelToJson(HautAnalyzeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
