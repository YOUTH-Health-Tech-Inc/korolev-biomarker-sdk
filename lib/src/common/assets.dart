abstract class YouthAssets {
  static const images = _Images();
  static const files = _Files();
}

class _Images {
  const _Images();

  static const _basePathImage = 'packages/youth_biomarkers_sdk/assets/images';

  final scanFrame = '$_basePathImage/img_scan_frame.png';
}

class _Files {
  const _Files();

  static const _basePathFiles = 'packages/youth_biomarkers_sdk/assets/files';

  final liqaScript = '$_basePathFiles/liqa_script.txt';
}
