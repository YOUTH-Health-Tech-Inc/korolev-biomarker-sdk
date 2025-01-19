import 'package:flutter/material.dart';

import '../../../common/assets.dart';
import '../../../wrapper/youth_video_image_data.dart';


class YouthFaceDetectionView extends StatelessWidget {
  const YouthFaceDetectionView(
      {super.key, required this.size, required this.imageInfo});

  final Size? size;
  final YouthVideoImageData? imageInfo;

  @override
  Widget build(BuildContext context) {
    if (imageInfo == null) {
      return Container();
    }

    var roi = imageInfo!.roi;
    if (roi == null) {
      return Container();
    }

    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var widthFactor = size!.width / (imageInfo!.imageWidth / devicePixelRatio);
    var heightFactor =
        size!.height / (imageInfo!.imageHeight / devicePixelRatio);
    return Positioned(
        left: (roi.left * widthFactor) / devicePixelRatio,
        top: (roi.top * heightFactor) / devicePixelRatio,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(YouthAssets.images.scanFrame),
                    fit: BoxFit.contain)
            ),
            width: 20 + (roi.width * widthFactor) / devicePixelRatio,
            height: 20 + (roi.height * heightFactor) / devicePixelRatio));
  }
}
