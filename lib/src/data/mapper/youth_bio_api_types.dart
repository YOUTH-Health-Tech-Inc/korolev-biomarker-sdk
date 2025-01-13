import 'package:biosensesignal_flutter_sdk/vital_signs/vital_sign_types.dart';

class YouthBiomarkerApiProps {
  static Map<int, YouthBiomarkerProperties> youthBinahPropertiesMap = {
    VitalSignTypes.pulseRate : YouthBiomarkerProperties(youthType: 'heart_rate', youthName: 'Resting Heart Rate', unitOfMeasure: 'bpm'),
    VitalSignTypes.oxygenSaturation : YouthBiomarkerProperties(youthType: 'oxygen_saturation', youthName: 'Oxygen Saturation', unitOfMeasure: '%'),
    VitalSignTypes.bloodPressure : YouthBiomarkerProperties(youthType: 'blood_pressure_systolic', youthName: 'Blood Pressure - Systolic/Diastolic', unitOfMeasure: 'mmHg'),
    VitalSignTypes.sdnn : YouthBiomarkerProperties(youthType: 'hrv_sdnn', youthName: 'HRV SDNN', unitOfMeasure: 'ms'),
    VitalSignTypes.hemoglobinA1C : YouthBiomarkerProperties(youthType: 'hba1c', youthName: 'Hba1c Metabolic Index', unitOfMeasure: '%'),
    VitalSignTypes.rri : YouthBiomarkerProperties(youthType: 'hrv_rri', youthName: 'RRi', unitOfMeasure: '?'),
    VitalSignTypes.rmssd : YouthBiomarkerProperties(youthType: 'hrv_sdnn', youthName: 'RMSSD', unitOfMeasure: '?'),
    VitalSignTypes.sd1 : YouthBiomarkerProperties(youthType: 'hrv_sdnn', youthName: 'SD1', unitOfMeasure: 'ms'),
    VitalSignTypes.sd2 : YouthBiomarkerProperties(youthType: 'hrv_sdnn', youthName: 'SD2', unitOfMeasure: 'ms'),
    VitalSignTypes.lfhf : YouthBiomarkerProperties(youthType: 'hrv_sdnn', youthName: 'LF/HF', unitOfMeasure: '?'),
  };
}

//TODO: it should be provided by our server
class YouthBiomarkerProperties {
  String youthType;
  String youthName;
  String unitOfMeasure;

  YouthBiomarkerProperties({required this.youthType, required this.youthName, required this.unitOfMeasure});
}