import '../data/core/api_service.dart';

class YouthSelfieController {
  YouthSelfieController({required this.onFinalResult}) {
    _apiService = ApiService();
  }

  String _base64Selfie = '';
  late ApiService _apiService;
  final Function(String) onFinalResult;

  void init(String base64Selfie) {
    _base64Selfie = base64Selfie;
  }

  Future<void> start() async {
    try {
      if(_base64Selfie.isNotEmpty) {
        var result = await _apiService.postSelfieDataForAnalysis(_base64Selfie);
        onFinalResult(result);
      } else {
        print('base64Selfie is not initialized');
      }
    } catch (e) {
      print('Server communication error $e');
    }
  }

  void stop() {
    // TODO: implement stop
  }

  void dispose() {
    _base64Selfie = '';
  }
}
