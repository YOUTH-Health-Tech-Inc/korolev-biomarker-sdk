import 'package:biosensesignal_flutter_sdk/images/image_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:youth_biomarkers_sdk/src/interface/abstract_video_controller.dart';

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

  final Function(ImageData) onGetImage;
  final Function(String)? onWarning;

  final Function(String)? onResult;
  final Function(String)? onFinalResult;

  final Function(String)? onState;
  final Function(String)? onError;

  late IVideoController _client;

  @override
  Future<void> init() async {
    //TODO: check the service type
    _client = BinahController(
        onGetImage: onGetImage,
        onWarningClient: onWarning,
        onResultClient: onResult,
        onFinalResultClient: onFinalResult,
        onStateClient: onState,
        onErrorClient: onError);
    await Permission.camera.request();
    await Permission.microphone.request();
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
