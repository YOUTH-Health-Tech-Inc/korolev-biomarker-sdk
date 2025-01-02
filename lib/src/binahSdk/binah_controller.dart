import 'package:biosensesignal_flutter_sdk/alerts/error_data.dart';
import 'package:biosensesignal_flutter_sdk/alerts/warning_data.dart';
import 'package:biosensesignal_flutter_sdk/health_monitor_exception.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data_listener.dart';
import 'package:biosensesignal_flutter_sdk/license/license_details.dart';
import 'package:biosensesignal_flutter_sdk/license/license_info.dart';
import 'package:biosensesignal_flutter_sdk/session/session.dart';
import 'package:biosensesignal_flutter_sdk/session/session_builder/face_session_builder.dart';
import 'package:biosensesignal_flutter_sdk/session/session_enabled_vital_signs.dart';
import 'package:biosensesignal_flutter_sdk/session/session_info_listener.dart';
import 'package:biosensesignal_flutter_sdk/session/session_state.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_listener.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vital_signs_results.dart';
import 'package:biosensesignal_flutter_sdk/vital_signs/vitals/vital_sign.dart';

import '../../youth_biomarkers_sdk.dart';
import '../interface/abstract_video_controller.dart';

const _defaultDuration = 60;

class BinahController
    implements
        SessionInfoListener,
        VitalSignsListener,
        ImageDataListener,
        IVideoController {
  BinahController({required this.onGetImage, this.onWarningClient, this.onResultClient, this.onFinalResultClient,
    this.onStateClient, this.onErrorClient});
  final Function(String)? onWarningClient;
  final Function(String)? onResultClient;
  final Function(String)? onFinalResultClient;
  final Function(String)? onStateClient;
  final Function(String)? onErrorClient;

  final Function(YouthVideoImageData) onGetImage;
  late Session _session;

  @override
  Future<void> init() async {
    try {
      _session = await FaceSessionBuilder()
          .withStrictMeasurementGuidance(true)
          .withImageDataListener(this)
          .withVitalSignsListener(this)
          .withSessionInfoListener(this)
          .build(LicenseDetails("6D548A-CBF9AF-43AD83-EB889E-898C7A-8D11DC"));
    } on HealthMonitorException catch (e) {
      print("Error - " + e.toString());
    }
  }

  @override
  Future<void> start({int? duration}) async {
    _session.start(duration ?? _defaultDuration);
  }

  @override
  Future<void> stop() async {
    // TODO: implement stop
  }

  @override
  Future<void> dispose() async {
    await _session.stop();
    await _session.terminate();
  }

  @override
  void onEnabledVitalSigns(SessionEnabledVitalSigns enabledVitalSigns) {
    print("SessionEnabledVitalSigns: " + enabledVitalSigns.toString());
  }

  @override
  void onError(ErrorData errorData) {
    print("ErrorData: " + errorData.toString());
  }

  @override
  void onFinalResults(VitalSignsResults results) {
    print("VitalSignsResults: " + results.toString());
  }

  @override
  void onImageData(ImageData imageData) {
    final castedImageData = imageData as YouthVideoImageData;
    onGetImage(castedImageData);
  }

  @override
  void onLicenseInfo(LicenseInfo licenseInfo) {
    print("LicenseInfo: " + licenseInfo.toString());
  }

  @override
  void onSessionStateChange(SessionState sessionState) {
    if (sessionState == SessionState.ready) {}
    print("SessionState: " + sessionState.toString());
  }

  @override
  void onVitalSign(VitalSign vitalSign) {
    print("VitalSign: " + vitalSign.toString());
  }

  @override
  void onWarning(WarningData warningData) {
    print("Warning: " + warningData.domain);
  }
}
