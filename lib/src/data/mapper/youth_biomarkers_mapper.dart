import 'dart:convert';

import 'package:biosensesignal_flutter_sdk/vital_signs/vital_sign_types.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_results.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign.dart';
import 'package:youth_biomarkers_sdk/src/data/mapper/youth_bio_api_types.dart';

import '../../wrapper/youth_biomarkers_client_format_data.dart';
import 'youth_bio_json_serialization.dart';

class YouthBiomarkersMapper implements VitalSignTypes {
  //singleton initialization
  YouthBiomarkersMapper._internal();

  static final YouthBiomarkersMapper _instance =
      YouthBiomarkersMapper._internal();

  factory YouthBiomarkersMapper() {
    return _instance;
  }

  List<YouthBiomarkerClientData> mapBioJsonToClientDataList(String json) {
    // whole JSON to Map
    Map<String, dynamic> jsonMap = jsonDecode(json);
    // list of JSON "data" from base  JSON
    List<dynamic> dataJsonList = jsonMap['data'];
    // JSON bio list to list of dart objects
    List<BiomarkerJsonParsedData> biomarkerList = dataJsonList
        .map((item) => BiomarkerJsonParsedData.fromJson(item))
        .toList();

    // create list of serialized and mapped biomarkers data
    List<YouthBiomarkerClientData> mappedBioFromJsonList = [];
    for (BiomarkerJsonParsedData data in biomarkerList) {
      final mappedBiomarkerData = YouthBiomarkerClientData(
          taskId: data.captureTaskId,
          biomarkerType: data.type,
          biomarkerName: data.displayName,
          biomarkerValue: data.value.valueStr,
          unitOfMeasurement: data.value.unit);
      mappedBioFromJsonList.add(mappedBiomarkerData);
    }

    return mappedBioFromJsonList;
  }

  List<YouthBiomarkerClientData> mapBioServiceObjToClientDataList(
      Object serviceObject) {
    final List<YouthBiomarkerClientData> mappedBioFromServiceList = [];

    if (serviceObject.runtimeType is VitalSignsResults) {
      final vitalSigns = (serviceObject as VitalSignsResults).getResults();
      if (vitalSigns.isNotEmpty) {
        for (VitalSign sign in vitalSigns) {
          final youthBioProps =
              YouthBiomarkerApiProps.youthBinahPropertiesMap[sign.type];
          final mappedBiomarkerData = new YouthBiomarkerClientData(
              taskId: null,
              biomarkerType: youthBioProps?.youthType,
              biomarkerName: youthBioProps?.youthName,
              biomarkerValue: sign.value.toString(),
              unitOfMeasurement: youthBioProps?.unitOfMeasure);
          mappedBioFromServiceList.add(mappedBiomarkerData);
        }
      }
    }

    return mappedBioFromServiceList;
  }
}
