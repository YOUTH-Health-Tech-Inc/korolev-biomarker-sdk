import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_results.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign.dart';
import 'package:youth_biomarkers_sdk/src/biomarker_services/binah_sdk/binah_bio_scheme.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_scheme.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_scheme_item.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_type.dart';
import 'package:youth_biomarkers_sdk/src/wrapper/youth_data_point.dart';

final class YouthResultMapper {
  static List<YouthDataPoint> handleBinahResults(VitalSignsResults results) {
    return results.getResults().map((item) => handleBinahResult(item)).toList();
  }

  static YouthDataPoint handleBinahResult(VitalSign result) {
    final schemeItem = _convertBinahTypeToYouth(result.type);
    return YouthDataPoint(
      type: schemeItem.type.key,
      name: schemeItem.name,
      value: result.value,
      unit: schemeItem.unit,
    );
  }

  static YouthBioSchemeItem _convertBinahTypeToYouth(int type) {
    final youthType = switch(type) {
      BinahBioScheme.pulseRate => YouthBioType.heartRate,
      BinahBioScheme.oxygenSaturation => YouthBioType.oxygenSaturation,
      BinahBioScheme.bloodPressure => YouthBioType.bloodPressureDiastolic,
      BinahBioScheme.sdnn => YouthBioType.hrvSdnn,
      BinahBioScheme.hemoglobinA1C => YouthBioType.hba1c,
      BinahBioScheme.rri => YouthBioType.hrvRri,
      BinahBioScheme.rmssd => YouthBioType.hrvRmssd,
      BinahBioScheme.sd1 => YouthBioType.hrvSd1,
      BinahBioScheme.sd2 => YouthBioType.hrvSd2,
      BinahBioScheme.lfhf => YouthBioType.hrvLfHf,
      BinahBioScheme.diabetesRisk => YouthBioType.binahDiabetesRisk,
      BinahBioScheme.hemoglobin => YouthBioType.hemoglobin,
      BinahBioScheme.pnsIndex => YouthBioType.binahPns,
      BinahBioScheme.snsIndex => YouthBioType.binahSns,
      BinahBioScheme.stressLevel => YouthBioType.binahStressResponse,
      BinahBioScheme.respirationRate => YouthBioType.binahRespiratoryFitness,
      _ => YouthBioType.unknown
    };

    return youthBioScheme.firstWhere((item) => item.type == youthType);
  }
}