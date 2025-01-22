import 'package:json_annotation/json_annotation.dart';

part 'haut_analyze_marker_model.g.dart';

@JsonSerializable()
class HautAnalyzeMarkerModel {
  HautAnalyzeMarkerModel(this.type, this.value);

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "value")
  final HautAnalyzeValueModel value;

  factory HautAnalyzeMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$HautAnalyzeMarkerModelFromJson(json);

  Map<String, dynamic> toJson() => _$HautAnalyzeMarkerModelToJson(this);
}

@JsonSerializable()
class HautAnalyzeValueModel {
  HautAnalyzeValueModel(this.value);

  @JsonKey(name: "value")
  final dynamic value;

  factory HautAnalyzeValueModel.fromJson(Map<String, dynamic> json) =>
      _$HautAnalyzeValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$HautAnalyzeValueModelToJson(this);
}