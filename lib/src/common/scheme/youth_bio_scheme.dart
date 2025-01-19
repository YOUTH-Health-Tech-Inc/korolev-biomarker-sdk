import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_measure_type.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_scheme_item.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_type.dart';

const youthBioScheme = [
  YouthBioSchemeItem(
    type: YouthBioType.unknown,
    name: 'unknown',
    unit: YouthBioUnitType.unknown,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.heartRate,
    name: 'Heart Rate',
    unit: YouthBioUnitType.bpm,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.bloodPressureSystolic,
    name: 'Blood Pressure - Systolic',
    unit: YouthBioUnitType.mmHg,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.bloodPressureDiastolic,
    name: 'Blood Pressure - Diastolic',
    unit: YouthBioUnitType.mmHg,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hrvSdnn,
    name: 'HRV SDNN',
    unit: YouthBioUnitType.ms,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hrvRri,
    name: 'Mean RRi',
    unit: YouthBioUnitType.ms,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hrvRmssd,
    name: 'RMSSD',
    unit: YouthBioUnitType.ms,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hrvSd1,
    name: 'SD1',
    unit: YouthBioUnitType.ms,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hrvSd2,
    name: 'SD2',
    unit: YouthBioUnitType.ms,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hrvLfHf,
    name: 'LF/HF',
    unit: YouthBioUnitType.ms,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hba1c,
    name: 'Average glucose index',
    unit: YouthBioUnitType.percent,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahDiabetesRisk,
    name: 'Metabolic index',
    unit: YouthBioUnitType.percent,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.hemoglobin,
    name: 'Hemoglobin',
    unit: YouthBioUnitType.gdL,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.prq,
    name: 'Pulse Respiratory Quotient (PRQ)',
    unit: YouthBioUnitType.num,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.breathingRate,
    name: 'Breathing rate',
    unit: YouthBioUnitType.bpm,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.oxygenSaturation,
    name: 'Oxygen saturation',
    unit: YouthBioUnitType.percent,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahRespiratoryFitness,
    name: 'Binah Respiratory fitness',
    unit: YouthBioUnitType.status,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahStressIndex,
    name: 'Stress Index',
    unit: YouthBioUnitType.status,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahRecoverAbility,
    name: 'Recovery Ability / Energy',
    unit: YouthBioUnitType.status,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahStressResponse,
    name: 'Stress response',
    unit: YouthBioUnitType.status,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahSns,
    name: 'SNS Index',
    unit: YouthBioUnitType.num,
  ),
  YouthBioSchemeItem(
    type: YouthBioType.binahPns,
    name: 'PNS index',
    unit: YouthBioUnitType.num,
  )
];
