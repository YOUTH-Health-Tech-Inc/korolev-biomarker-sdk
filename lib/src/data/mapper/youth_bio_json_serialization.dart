class BiomarkerJsonParsedData {
  final int? captureTaskId;
  final String type;
  final String displayName;
  final BiomarkerValue value;

  BiomarkerJsonParsedData({
    this.captureTaskId,
    required this.type,
    required this.displayName,
    required this.value,
  });

  factory BiomarkerJsonParsedData.fromJson(Map<String, dynamic> json) {
    return BiomarkerJsonParsedData(
      captureTaskId: json['capture_task_id'],
      type: json['type'],
      displayName: json['display_name'],
      value: BiomarkerValue.fromJson(json['value']),
    );
  }
}

class BiomarkerValue {
  final String type;
  final dynamic value;
  final String valueStr;
  final String unit;

  BiomarkerValue({
    required this.type,
    required this.value,
    required this.valueStr,
    required this.unit,
  });

  factory BiomarkerValue.fromJson(Map<String, dynamic> json) {
    return BiomarkerValue(
      type: json['type'],
      value: json['value'],
      valueStr: json['value_str'],
      unit: json['unit'],
    );
  }

/* EXAMPLE OF JSON FOR MAPPING
  {"type": "face_photo_haut",
  "status": "completed",
  "data": [
  {
  "capture_task_id": null,
  "type": "face_skin_perceived_age",
  "display_name": "Face Skin Perceived Age",
  "value": {
  "type": "int",
  "value": 29,
  "value_str": "29",
  "unit": "years"
  }}
  ],
  "meta": {
  "input_size": "965 bytes"
  }}
  */
}
