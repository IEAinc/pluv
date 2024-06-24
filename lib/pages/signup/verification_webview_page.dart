import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global/global.dart';
import '../../global/my_firebase_service.dart';

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


  String url = "https://asia-northeast3-pluv-16c7b.cloudfunctions.net/verificationApi/verification/ready";


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
      appBar: AppBar(title: Text("VerificationWebviewsdfPage"),),
      body: Column(
        children: [

          Text("Sd"),
          Container(
            height: 100,
            width: 300,
            color: Colors.red,
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri("https://m.naver.com/")),
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
