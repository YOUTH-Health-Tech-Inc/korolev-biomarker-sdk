import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youth_biomarkers_sdk/src/data/models/haut_analyze_model.dart';

part 'rest_client.g.dart';

const baseUrl = "https://test.youth-api.com/api/";
const apiVersionV2 = "v2";

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("$apiVersionV2/processing/face_photo/")
  Future<HautAnalyzeModel> analyzeSelfieByHaut(
      @Field("base64url_bytes") String imageBase64);
}
