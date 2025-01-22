import 'package:youth_biomarkers_sdk/src/common/mapper/youth_result_mapper.dart';
import 'package:youth_biomarkers_sdk/src/data/core/api_service.dart';
import 'package:youth_biomarkers_sdk/src/wrapper/youth_data_point.dart';

class YouthSelfieController {
  const YouthSelfieController();

  Future<List<YouthDataPoint>?> analyzeSelfie(String imageBase64) async {
    try {
      final hautResult = await ApiService().getSelfieAnalyzeData(imageBase64);
      return YouthResultMapper.handleHautResults(hautResult);
    } catch (e) {
      return null;
    }
  }
}
