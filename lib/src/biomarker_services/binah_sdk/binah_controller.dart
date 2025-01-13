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

import '../../../youth_sdk_exports.dart';
import '../../data/mapper/youth_biomarkers_mapper.dart';
import '../../interface/abstract_video_controller.dart';
import '../../wrapper/youth_video_image_data.dart';


const _defaultDuration = 60;

class BinahController
    implements
        SessionInfoListener,
        VitalSignsListener,
        ImageDataListener,
        IVideoController {
  BinahController({required this.onGetImage, this.onWarningClient, this.onResultClient, this.onFinalResultClient,
    this.onStateClient, this.onErrorClient});
  final Function(YouthVideoWarningData)? onWarningClient;
  final Function(String)? onResultClient;
  final Function(List<YouthBiomarkerClientData>)? onFinalResultClient;
  final Function(YouthVideoState)? onStateClient;
  final Function(YouthVideoErrorData)? onErrorClient;

  final Function(YouthVideoImageData) onGetImage;
  late Session _session;

  @override
  Future<void> init() async {
    try {
      onStateClient?.call(YouthVideoState.initialization);
      _session = await FaceSessionBuilder()
          .withStrictMeasurementGuidance(true)
          .withImageDataListener(this)
          .withVitalSignsListener(this)
          .withSessionInfoListener(this)
          .build(LicenseDetails("6D548A-CBF9AF-43AD83-EB889E-898C7A-8D11DC"));
      await onStateClient?.call(YouthVideoState.initialized);
    } on HealthMonitorException catch (e) {
      final error = new YouthVideoErrorData(code: e.code, message: e.domain);
      onErrorClient?.call(error);
    }
  }

  @override
  void start({int? duration}) {
    _session.start(duration ?? _defaultDuration);
    onStateClient?.call(YouthVideoState.process);
  }

  @override
  Future<void> stop() async {
    // TODO: implement stop
    await onStateClient?.call(YouthVideoState.stopped);
  }

  @override
  Future<void> dispose() async {
    await _session.stop();
    await _session.terminate();
    await onStateClient?.call(YouthVideoState.disposed);
  }

  @override
  void onEnabledVitalSigns(SessionEnabledVitalSigns enabledVitalSigns) {
    print("SessionEnabledVitalSigns: " + enabledVitalSigns.toString());
  }

  @override
  void onError(ErrorData errorData) {
    final error = new YouthVideoErrorData(code: errorData.code, message: errorData.domain);
    onErrorClient?.call(error);
  }

  @override
  void onFinalResults(VitalSignsResults results) {
    final mappedResult = YouthBiomarkersMapper().mapBioServiceObjToClientDataList(results);
    onFinalResultClient?.call(mappedResult);
  }

  @override
  void onImageData(ImageData imageData) {
    final castedImageData = new YouthVideoImageData( imageWidth: imageData.imageWidth,
      imageHeight: imageData.imageHeight, roi: imageData.roi,
    imageValidity: imageData.imageValidity);

    onGetImage(castedImageData);
  }

  @override
  void onLicenseInfo(LicenseInfo licenseInfo) {
    print("LicenseInfo: " + licenseInfo.toString());
  }

  @override
  void onSessionStateChange(SessionState sessionState) {
    if (sessionState == SessionState.ready) {
      print(sessionState);
    }
  }

  @override
  void onVitalSign(VitalSign vitalSign) {
    onResultClient?.call(vitalSign.toString());
  }

  @override
  void onWarning(WarningData warningData) {
    final warning = new YouthVideoWarningData(code: warningData.code, message: warningData.domain);
    onWarningClient?.call(warning);
  }
}
