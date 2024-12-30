abstract class IVideoCallBackController {
  Function(String)? onWarning;

  Function(String)? onError;

  Function(String)? onResult;

  Function(String)? onFinalResult;

  Function(String)? onState;
}
