import 'package:biosensesignal_flutter_sdk/alerts/error_data.dart';
import 'package:biosensesignal_flutter_sdk/alerts/warning_data.dart';
import 'package:biosensesignal_flutter_sdk/health_monitor_exception.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data.dart';
import 'package:biosensesignal_flutter_sdk/images/image_data_listener.dart';
import 'package:biosensesignal_flutter_sdk/images/image_validity.dart';
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
import 'package:youth_biomarkers_sdk/src/common/mapper/youth_result_mapper.dart';

import '../../../youth_sdk_exports.dart';
import '../../interface/abstract_measurement_controller.dart';

const _defaultDuration = 60;

class BinahController
    implements
        SessionInfoListener,
        VitalSignsListener,
        ImageDataListener,
        IMeasurementController {
  BinahController({
    required this.onGetImage,
    this.onWarningClient,
    this.onResultClient,
    this.onFinalResultClient,
    this.onStateClient,
    this.onErrorClient,
  });

  final Function(YouthVideoWarningData?)? onWarningClient;
  final Function(YouthDataPoint)? onResultClient;
  final Function(List<YouthDataPoint>)? onFinalResultClient;
  final Function(YouthVideoState)? onStateClient;
  final Function(YouthVideoErrorData)? onErrorClient;

  final Function(YouthVideoImageData) onGetImage;
  late Session _session;

  @override
  Future<void> init() async {
    try {
      onStateClient?.call(YouthVideoState.initialization);
      _session = await FaceSessionBuilder()
          .withImageDataListener(this)
          .withVitalSignsListener(this)
          .withSessionInfoListener(this)
          .build(LicenseDetails("6D548A-CBF9AF-43AD83-EB889E-898C7A-8D11DC"));
      await onStateClient?.call(YouthVideoState.initialized);
    } on HealthMonitorException catch (e) {
      final error = YouthVideoErrorData(code: e.code, message: e.domain);
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
    await onStateClient?.call(YouthVideoState.stopped);
  }

  @override
  Future<void> dispose() async {
    await _session.terminate();
    await onStateClient?.call(YouthVideoState.disposed);
  }

  @override
  void onEnabledVitalSigns(SessionEnabledVitalSigns enabledVitalSigns) {}

  @override
  void onLicenseInfo(LicenseInfo licenseInfo) {}

  @override
  void onImageData(ImageData imageData) {
    final castedImageData = YouthVideoImageData(
        imageWidth: imageData.imageWidth,
        imageHeight: imageData.imageHeight,
        roi: imageData.roi,
        imageValidity: imageData.imageValidity);

    _checkImageValidity(imageData.imageValidity);
    onGetImage(castedImageData);
  }

  @override
  void onSessionStateChange(SessionState sessionState) {}

  @override
  void onVitalSign(VitalSign vitalSign) {
    final dataPoint = YouthResultMapper.handleBinahResult(vitalSign);
    onResultClient?.call(dataPoint);
  }

  @override
  void onFinalResults(VitalSignsResults results) {
    final dataPoints = YouthResultMapper.handleBinahResults(results);
    onStateClient?.call(YouthVideoState.complete);
    onFinalResultClient?.call(dataPoints);
  }

  @override
  void onWarning(WarningData warningData) {
    final warning = YouthVideoWarningData(
        code: warningData.code, message: warningData.domain);
    onWarningClient?.call(warning);
  }

  @override
  void onError(ErrorData errorData) {
    final error =
        YouthVideoErrorData(code: errorData.code, message: errorData.domain);
    onErrorClient?.call(error);
  }

  void _checkImageValidity(int validity) {
    switch (validity) {
      case ImageValidity.valid:
        onWarningClient?.call(null);
        break;
      case ImageValidity.invalidDeviceOrientation:
        // Invalid device orientation
        onWarningClient?.call(YouthVideoWarningData(
          code: validity,
          message: "Invalid device orientation",
        ));
        break;
      case ImageValidity.invalidRoi:
        // Invalid ROI
        onWarningClient?.call(YouthVideoWarningData(
          code: validity,
          message: "Can't recognize your face",
        ));
        break;
      case ImageValidity.tiltedHead:
        // Tilted Head
        onWarningClient?.call(YouthVideoWarningData(
          code: validity,
          message: "Keep your head level",
        ));
        break;
      case ImageValidity.faceTooFar:
        // Face Too Far
        onWarningClient?.call(YouthVideoWarningData(
          code: validity,
          message: "Your face is too far",
        ));
        break;
      case ImageValidity.unevenLight:
        // Uneven Light
        onWarningClient?.call(YouthVideoWarningData(
          code: validity,
          message: "Uneven light",
        ));
        break;
    }
  }
}
