import 'dart:ui';

class YouthVideoImageData {
  final int imageWidth;
  final int imageHeight;
  final Rect? roi;
  final int imageValidity;

  YouthVideoImageData(
      {required this.imageWidth,
        required this.imageHeight,
        required this.roi,
        required this.imageValidity});
}