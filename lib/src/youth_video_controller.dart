import 'package:permission_handler/permission_handler.dart';
import 'package:youth_biomarkers_sdk/src/interface/abstract_video_controller.dart';

import '../youth_biomarkers_sdk.dart';
import 'binahSdk/binah_controller.dart';

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
  final Function(String)? onWarning;

  final Function(String)? onResult;
  final Function(String)? onFinalResult;

  final Function(String)? onState;
  final Function(String)? onError;

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
  Future<void> start({int? duration}) async {
    // TODO: implement dispose
    await _client.start(duration: duration);
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
