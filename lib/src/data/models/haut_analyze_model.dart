import 'package:json_annotation/json_annotation.dart';
import 'package:youth_biomarkers_sdk/src/data/models/haut_analyze_marker_model.dart';

part 'haut_analyze_model.g.dart';

@JsonSerializable()
class HautAnalyzeModel {
  HautAnalyzeModel(this.data);

  @JsonKey(name: "data")
  final List<HautAnalyzeMarkerModel> data;

  factory HautAnalyzeModel.fromJson(Map<String, dynamic> json) =>
      _$HautAnalyzeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HautAnalyzeModelToJson(this);
}