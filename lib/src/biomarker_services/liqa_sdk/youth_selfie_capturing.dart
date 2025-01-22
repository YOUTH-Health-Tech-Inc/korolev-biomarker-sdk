import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/assets.dart';

const _webViewMimeType = 'text/html';
const _webViewUri = 'https://localhost/';

const _callbackHandlerName = 'postMessage';

class YouthSelfieCaptureView extends StatefulWidget {
  final Function(String imageBase64) onSelfieCaptured;

  const YouthSelfieCaptureView(this.onSelfieCaptured, {super.key});

  @override
  State<YouthSelfieCaptureView> createState() => _YouthSelfieCaptureViewState();
}

class _YouthSelfieCaptureViewState extends State<YouthSelfieCaptureView> {
  String _script = '';

  @override
  void initState() {
    super.initState();
    _getScript();
  }

  Future<void> _getScript() async {
    await Permission.camera.request();
    _script = await rootBundle.loadString(YouthAssets.files.liqaScript);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _script.isEmpty
        ? SizedBox.shrink()
        : InAppWebView(
            initialData: InAppWebViewInitialData(
                mimeType: _webViewMimeType,
                data: _script,
                baseUrl: WebUri(_webViewUri)),
            initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: false,
                allowsInlineMediaPlayback: true,
                disableHorizontalScroll: true,
                disableVerticalScroll: true,
                supportZoom: true,
                sharedCookiesEnabled: true),
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                  resources: request.resources,
                  action: PermissionResponseAction.GRANT);
            },
            onWebViewCreated: (InAppWebViewController controller) {
              controller.addJavaScriptHandler(
                handlerName: _callbackHandlerName,
                callback: (args) => _handleCallback(args),
              );
            },
          );
  }

  void _handleCallback(List<dynamic> args) {
    if (args.isNotEmpty) {
      final messageObject = jsonDecode(args[0]) as Map<String, dynamic>;
      final payload = messageObject['payload'] as Map<String, dynamic>?;
      if (payload != null) {
        widget.onSelfieCaptured(_convertDataToImageBase64(payload['data']));
      }
    }
  }

  String _convertDataToImageBase64(String data) {
    return data.replaceFirst('data:image/jpeg;base64,', '');
  }
}
