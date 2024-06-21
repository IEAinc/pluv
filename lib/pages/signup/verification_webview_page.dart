import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global/global.dart';

///VerificationWebviewPage
///담당자 : ---

class VerificationWebviewPage extends StatefulWidget {
  const VerificationWebviewPage({Key? key}) : super(key: key);

  @override
  State<VerificationWebviewPage> createState() => _VerificationWebviewPageState();
}

class _VerificationWebviewPageState extends State<VerificationWebviewPage> {

  @override
  void initState() {
    super.initState();
    logger.i("VerificationWebviewPage");
  }



  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      useShouldOverrideUrlLoading: true,
      useHybridComposition: true,
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VerificationWebviewPage"),),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri("localhost:3000/certification/Ready")),
              initialSettings: settings,
              onWebViewCreated: (controller) {
                webViewController = controller;
                webViewController?.addJavaScriptHandler(
                    handlerName: 'success', callback: (d){logger.e(d);});
                webViewController?.addJavaScriptHandler(
                    handlerName: 'error', callback: (d){logger.e(d);});
              },
              onLoadStart: (controller, url) {

                logger.e("start!!");
              },
              onPermissionRequest: (controller, request) async {
                return PermissionResponse(
                    resources: request.resources,
                    action: PermissionResponseAction.GRANT);
              },

            ),
          ),
        ],
      ),
    );
  }
}
