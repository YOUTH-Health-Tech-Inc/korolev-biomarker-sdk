class YouthSdk {
  static final YouthSdk _instance = YouthSdk._internal();

  YouthSdk._internal();

  factory YouthSdk() {
    return _instance;
  }

  Future<String> init(String apiKey, String userId, String lang) async {
    //TODO: request to our server and save response data
    await Future.delayed(Duration(seconds: 3));
    return "Success";
  }
}
