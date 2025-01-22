import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:youth_biomarkers_sdk/src/data/core/rest_client.dart';
import 'package:youth_biomarkers_sdk/src/data/models/haut_analyze_model.dart';

class ApiService {
  static final ApiService _instance = ApiService._();
  late RestClient _client;

  ApiService._() {
    final dio = Dio();
    dio.interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true, printResponseHeaders: true)));
    _client = RestClient(dio);
  }

  factory ApiService() {
    return _instance;
  }

  Future<HautAnalyzeModel> getSelfieAnalyzeData(String imageBase64) async {
    return _client.analyzeSelfieByHaut(imageBase64);
  }
}
