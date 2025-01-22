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
  binahPns("binah_pns"),
  faceSkinRedness("face_skin_redness"),
  faceSkinUniformness("face_skin_uniformness"),
  faceSkinHydration("face_skin_hydration"),
  faceSkinPoresHealth("face_skin_pores_health"),
  faceSkinAcneIndex("face_skin_acne_index"),
  faceSkinWrinklesIndex("face_skin_wrinkles_index"),
  faceSkinPigmentation("face_skin_pigmentation_index"),
  faceSkinEyeAreaCondition("face_skin_eye_area_condition"),
  faceSkinPerceivedAge("face_skin_perceived_age"),
  faceSkinEyeAge("face_skin_eye_age");

  final String key;

  const YouthBioType(this.key);
}