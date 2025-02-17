import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_results.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign_blood_pressure.dart';
import 'package:youth_biomarkers_sdk/src/biomarker_services/binah_sdk/binah_bio_scheme.dart';
import 'package:youth_biomarkers_sdk/src/biomarker_services/liqa_sdk/haut_bio_scheme.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_scheme.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_scheme_item.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_type.dart';
import 'package:youth_biomarkers_sdk/src/data/models/haut_analyze_marker_model.dart';
import 'package:youth_biomarkers_sdk/src/wrapper/youth_data_point.dart';

final class YouthResultMapper {
  static List<YouthDataPoint> handleBinahResults(VitalSignsResults results) {
    return results.getResults().fold(<YouthDataPoint>[], (previous, element) {
      if (element is VitalSignBloodPressure) {
        return previous..addAll(_handleBinahPressureResult(element));
      } else {
        return previous..add(handleBinahResult(element));
      }
    });
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

  static List<YouthDataPoint> _handleBinahPressureResult(VitalSign result) {
    final List<YouthDataPoint> results = [];
    try {
      final schemeItem = _convertBinahTypeToYouth(result.type);
      final bloodPressure = result as VitalSignBloodPressure;
      results.add(YouthDataPoint(
        type: YouthBioType.bloodPressureSystolic.key,
        name: YouthBioType.bloodPressureSystolic.name,
        value: bloodPressure.value.systolic,
        unit: schemeItem.unit,
      ));
      results.add(YouthDataPoint(
        type: YouthBioType.bloodPressureDiastolic.key,
        name: YouthBioType.bloodPressureDiastolic.name,
        value: bloodPressure.value.diastolic,
        unit: schemeItem.unit,
      ));
    } catch (_) {}

    return results;
  }

  static YouthBioSchemeItem _convertBinahTypeToYouth(int type) {
    final youthType = switch (type) {
      BinahBioScheme.pulseRate => YouthBioType.heartRate,
      BinahBioScheme.oxygenSaturation => YouthBioType.oxygenSaturation,
      BinahBioScheme.bloodPressure => YouthBioType.bloodPressureDiastolic,
      BinahBioScheme.sdnn => YouthBioType.hrvSdnn,
      BinahBioScheme.hemoglobinA1C => YouthBioType.hba1c,
      BinahBioScheme.meanRri => YouthBioType.hrvRri,
      BinahBioScheme.rmssd => YouthBioType.hrvRmssd,
      BinahBioScheme.sd1 => YouthBioType.hrvSd1,
      BinahBioScheme.sd2 => YouthBioType.hrvSd2,
      BinahBioScheme.lfhf => YouthBioType.hrvLfHf,
      BinahBioScheme.diabetesRisk => YouthBioType.binahDiabetesRisk,
      BinahBioScheme.hemoglobin => YouthBioType.hemoglobin,
      BinahBioScheme.pnsIndex => YouthBioType.binahPns,
      BinahBioScheme.prq => YouthBioType.prq,
      BinahBioScheme.snsIndex => YouthBioType.binahSns,
      BinahBioScheme.stressIndex => YouthBioType.binahStressIndex,
      BinahBioScheme.stressLevel => YouthBioType.binahStressLevel,
      BinahBioScheme.snsZone => YouthBioType.binahStressResponse,
      BinahBioScheme.respirationRate => YouthBioType.binahRespiratoryFitness,
      BinahBioScheme.pnsZone => YouthBioType.binahRecoverAbility,
      BinahBioScheme.hypertensionRisk => YouthBioType.binahHypertensionRisk,
      BinahBioScheme.wellnessIndex => YouthBioType.binahWellnessIndex,
      BinahBioScheme.wellnessLevel => YouthBioType.binahWellnessLevel,
      _ => YouthBioType.unknown
    };

    return youthBioScheme.firstWhere((item) => item.type == youthType);
  }

  static List<YouthDataPoint> handleHautResults(
      List<HautAnalyzeMarkerModel> data) {
    return data.map((item) => _handleHautResult(item)).toList();
  }

  static YouthDataPoint _handleHautResult(HautAnalyzeMarkerModel result) {
    final schemeItem = _convertHautTypeToYouth(result.name);
    return YouthDataPoint(
      type: schemeItem.type.key,
      name: schemeItem.name,
      value: result.value,
      unit: schemeItem.unit,
    );
  }

  static YouthBioSchemeItem _convertHautTypeToYouth(String type) {
    final youthType = switch (type) {
      HautBioScheme.faceSkinRedness => YouthBioType.faceSkinRedness,
      HautBioScheme.faceSkinUniformness => YouthBioType.faceSkinUniformness,
      HautBioScheme.faceSkinHydration => YouthBioType.faceSkinHydration,
      HautBioScheme.faceSkinPoresHealth => YouthBioType.faceSkinPoresHealth,
      HautBioScheme.faceSkinPerceivedAge => YouthBioType.faceSkinPerceivedAge,
      HautBioScheme.faceSkinEyeAge => YouthBioType.faceSkinEyeAge,
      HautBioScheme.faceSkinWrinklesIndex => YouthBioType.faceSkinWrinklesIndex,
      HautBioScheme.faceSkinAcneIndex => YouthBioType.faceSkinAcneIndex,
      HautBioScheme.faceSkinPigmentationIndex =>
        YouthBioType.faceSkinPigmentation,
      HautBioScheme.faceSkinEyeAreaCondition =>
        YouthBioType.faceSkinEyeAreaCondition,
      _ => YouthBioType.unknown
    };

    return youthBioScheme.firstWhere((item) => item.type == youthType);
  }
}
