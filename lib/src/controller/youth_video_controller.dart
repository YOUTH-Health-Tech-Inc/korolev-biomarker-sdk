import 'package:permission_handler/permission_handler.dart';
import 'package:youth_biomarkers_sdk/src/interface/abstract_video_controller.dart';
import 'package:youth_biomarkers_sdk/src/wrapper/youth_video_warning_data.dart';

import '../../youth_sdk_exports.dart';
import '../biomarker_services/binah_sdk/binah_controller.dart';
import '../wrapper/enums.dart';
import '../wrapper/typedefs.dart';
import '../wrapper/youth_video_error_data.dart';

class YouthVideoController implements IVideoController {
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

  final Function(String)? onResult;
  final Function(List<YouthBiomarkerClientData>)? onFinalResult;

  final Function(YouthVideoState)? onState;
  final Function(YouthVideoErrorData)? onError;

  late IVideoController _client;

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
