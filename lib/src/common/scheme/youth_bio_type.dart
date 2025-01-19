enum YouthBioType {
  unknown("unknown"),
  heartRate("heart_rate"),
  bloodPressureSystolic("blood_pressure_systolic"),
  bloodPressureDiastolic("blood_pressure_diastolic"),
  hrvSdnn("hrv_sdnn"),
  hrvRri("hrv_rri"),
  hrvRmssd("hrv_rmssd"),
  hrvSd1("hrv_sd1"),
  hrvSd2("hrv_sd2"),
  hrvLfHf("hrv_lf_hf"),
  hba1c("hba1c"),
  binahDiabetesRisk("binah_diabetes_risk"),
  hemoglobin("hemoglobin"),
  prq("prq"),
  breathingRate("breathing_rate"),
  oxygenSaturation("oxygen_saturation"),
  binahRespiratoryFitness("binah_respiratory_fitness"),
  binahStressIndex("binah_stress_index"),
  binahRecoverAbility("binah_recover_ability"),
  binahStressResponse("stress_response"),
  binahSns("binah_sns"),
  binahPns("binah_pns");

  final String key;

  const YouthBioType(this.key);
}