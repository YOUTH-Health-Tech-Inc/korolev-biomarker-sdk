import 'dart:ui';

import 'package:biosensesignal_flutter_sdk/images/image_data.dart';

class YouthVideoImageData extends ImageData {
  YouthVideoImageData({
    required int imageWidth,
    required int imageHeight,
    required Rect? roi,
    required int imageValidity,
  }) : super(
    imageWidth: imageWidth,
    imageHeight: imageHeight,
    roi: roi,
    imageValidity: imageValidity,
  );
}
