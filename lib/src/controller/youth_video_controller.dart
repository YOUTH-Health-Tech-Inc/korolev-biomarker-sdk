import 'package:permission_handler/permission_handler.dart';
import 'package:youth_biomarkers_sdk/src/interface/abstract_measurement_controller.dart';
import 'package:youth_biomarkers_sdk/src/wrapper/youth_data_point.dart';
import 'package:youth_biomarkers_sdk/src/wrapper/youth_video_warning_data.dart';

import '../../youth_sdk_exports.dart';
import '../biomarker_services/binah_sdk/binah_controller.dart';
import '../wrapper/enums.dart';
import '../wrapper/youth_video_error_data.dart';
import '../wrapper/youth_video_image_data.dart';

class YouthVideoController implements IMeasurementController {
  YouthVideoController(
      {required this.onGetImage,
      this.onWarning,
      this.onResult,
      this.onFinalResult,
      this.onState,
      this.onError});

  /*TODO: create common interface for onGetImage if
     new video service will be added
  */

  final Function(YouthVideoImageData) onGetImage;
  final Function(YouthVideoWarningData)? onWarning;

  final Function(YouthDataPoint)? onResult;
  final Function(List<YouthDataPoint>)? onFinalResult;

  final Function(YouthVideoState)? onState;
  final Function(YouthVideoErrorData)? onError;

  late IMeasurementController _client;

  @override
  Future<void> init() async {
    //TODO: check the service type
    await Permission.camera.request();
    _client = BinahController(
        onGetImage: onGetImage,
        onWarningClient: onWarning,
        onResultClient: onResult,
        onFinalResultClient: onFinalResult,
        onStateClient: onState,
        onErrorClient: onError);
    await _client.init();
  }

  @override
  void start({int? duration}) {
    _client.start(duration: duration);
  }

  @override
  Future<void> dispose() async {
    await _client.dispose();
  }

  @override
  Future<void> stop() async {
    await _client.stop();
  }
}
