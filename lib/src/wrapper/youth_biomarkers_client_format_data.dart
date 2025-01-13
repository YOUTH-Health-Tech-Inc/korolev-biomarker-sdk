class YouthBiomarkerClientData {
  YouthBiomarkerClientData({required this.taskId, required this.biomarkerType,
    required this.biomarkerName, required this.biomarkerValue, required this.unitOfMeasurement});

  final int? taskId;
  final String? biomarkerType;
  final String? biomarkerName;
  final String? biomarkerValue;
  final String? unitOfMeasurement;
}