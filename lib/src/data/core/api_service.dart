import 'package:dio/dio.dart';

//TODO: temporary decision until we have just one server request
class ApiService {
  Future<dynamic> postSelfieDataForAnalysis(String selfieBase64) async {
    try {
      final biomarkersResponse = await Dio().post(
          "https://test.youth-api.com/api/v2/processing/face_photo/",
          data: {'base64url_bytes', selfieBase64});
      return biomarkersResponse.data as String;
    } catch (e) {
      print('Server request error: $e');
    }
  }
}
