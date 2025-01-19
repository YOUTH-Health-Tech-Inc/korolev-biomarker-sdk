import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/assets.dart';

class YouthSelfieCapturing extends StatefulWidget {
  final Function(String name, dynamic value) onStatusChanged;

  const YouthSelfieCapturing(this.onStatusChanged);

  @override
  State<YouthSelfieCapturing> createState() => _SelfieCapturingState();
}

class _SelfieCapturingState extends State<YouthSelfieCapturing> {

  String _script = '';

  @override
  void initState() {
    super.initState();
    _getScript();
  }

  Future<void> _getScript() async {
    await Permission.camera.request();
    String script = await rootBundle.loadString(YouthAssets.files.liqaScript);
    setState(() {
      _script = script;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _script.isEmpty ? Container() : InAppWebView(
      initialData: InAppWebViewInitialData(
          mimeType: 'text/html',
          data: _script,
          baseUrl: WebUri("https://localhost/")),
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
          handlerName: 'postMessage',
          callback: (args) {
            if (args.isNotEmpty) {
              final messageObject = jsonDecode(args[0]) as Map<String, dynamic>;
              final payload = messageObject['payload'] as Map<String, dynamic>?;
              if (payload != null) {
                widget.onStatusChanged('base64', payload);
              }
            }
          },
        );
      },
    );
  }
}