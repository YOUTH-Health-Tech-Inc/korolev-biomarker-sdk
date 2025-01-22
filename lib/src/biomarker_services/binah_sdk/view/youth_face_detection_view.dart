import 'package:flutter/material.dart';

import '../../../common/assets.dart';
import '../../../wrapper/youth_video_image_data.dart';

const _faceFrameGap = 20.0;

class YouthFaceDetectionView extends StatefulWidget {
  const YouthFaceDetectionView(
      {super.key, required this.size, required this.imageInfo});

  final Size? size;
  final YouthVideoImageData? imageInfo;

  @override
  State<YouthFaceDetectionView> createState() => _YouthFaceDetectionViewState();
}

class _YouthFaceDetectionViewState extends State<YouthFaceDetectionView> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageInfo == null) {
      return SizedBox.shrink();
    }

    var roi = widget.imageInfo!.roi;
    if (roi == null) {
      return SizedBox.shrink();
    }

    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var widthFactor =
        widget.size!.width / (widget.imageInfo!.imageWidth / devicePixelRatio);
    var heightFactor = widget.size!.height /
        (widget.imageInfo!.imageHeight / devicePixelRatio);
    return Positioned(
        left: (roi.left * widthFactor) / devicePixelRatio,
        top: (roi.top * heightFactor) / devicePixelRatio,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(YouthAssets.images.scanFrame),
                    fit: BoxFit.contain)),
            width: _faceFrameGap + (roi.width * widthFactor) / devicePixelRatio,
            height: _faceFrameGap +
                (roi.height * heightFactor) / devicePixelRatio));
  }
}
