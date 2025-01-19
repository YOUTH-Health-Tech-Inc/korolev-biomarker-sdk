abstract class YouthAssets {
  static const images = _Images();
  static const files = _Files();
}

class _Images {
  const _Images();

  static const _basePathImage = 'assets/images';

  final scanFrame = '$_basePathImage/img_scan_frame.png';
}

class _Files {
  const _Files();

  static const _basePathFiles = 'lib/assets/files';

  final liqaScript = '$_basePathFiles/liqa_script.txt';
}