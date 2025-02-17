import 'package:json_annotation/json_annotation.dart';

part 'haut_analyze_marker_model.g.dart';

@JsonSerializable()
class HautAnalyzeMarkerModel {
  HautAnalyzeMarkerModel(this.name, this.value);

  @JsonKey(name: "biomarker_name")
  final String name;

  @JsonKey(name: "value")
  final String value;

  factory HautAnalyzeMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$HautAnalyzeMarkerModelFromJson(json);

  Map<String, dynamic> toJson() => _$HautAnalyzeMarkerModelToJson(this);
}