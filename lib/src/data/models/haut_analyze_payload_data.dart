import 'package:json_annotation/json_annotation.dart';

part 'haut_analyze_payload_data.g.dart';

@JsonSerializable()
class HautAnalyzePayloadData {
  HautAnalyzePayloadData(this.base64Image);

  @JsonKey(name: "base64url_bytes")
  final String base64Image;

  factory HautAnalyzePayloadData.fromJson(Map<String, dynamic> json) =>
      _$HautAnalyzePayloadDataFromJson(json);

  Map<String, dynamic> toJson() => _$HautAnalyzePayloadDataToJson(this);
}