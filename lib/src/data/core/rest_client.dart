import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youth_biomarkers_sdk/src/data/models/haut_analyze_marker_model.dart';
import 'package:youth_biomarkers_sdk/src/data/models/haut_analyze_payload_data.dart';

part 'rest_client.g.dart';

const baseUrl = "https://test.youth-api.com/api/";
const apiVersionV2 = "v2";

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("$apiVersionV2/capture/selfie/")
  Future<List<HautAnalyzeMarkerModel>> analyzeSelfieByHaut(
      @Field("user_id") String userId,
      @Field("client_id") String clientId,
      @Field("payload") HautAnalyzePayloadData payload);
}
