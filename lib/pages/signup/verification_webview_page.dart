import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:pluv/pages/signup/sign_up_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../component/custom_progress_indicator.dart';
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


  String url = "https://us-central1-pluv-16c7b.cloudfunctions.net/api/verification/ready";
  bool isLoading = true;

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
      appBar: customAppBar(title: "본인인증"),
      body: Stack(
        children: [

          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(url)),
            initialSettings: settings,
            onWebViewCreated: (controller) {
              webViewController = controller;

              webViewController?.addJavaScriptHandler(handlerName: 'successHandler', callback: (args) {
                if (args[0] == 'success') {
                  // 인증 성공 시의 Flutter 액션
                  logger.e(args[1]);
                  Get.off(()=>SignUpPage(result : args[1]["result"]));
                }else{

                  //실패했다고 스넥바 띄어주고 겟백
                  Get.back();

                }
              });
            },
            onLoadStart: (controller, url) {
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (controller, url) async {
              setState(() {
                isLoading = false;
              });
            },
            onReceivedError: (a,b,c) {
              setState(() {
                isLoading = false;
              });
            },
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                  resources: request.resources,
                  action: PermissionResponseAction.GRANT);
            },
            shouldOverrideUrlLoading:
                (controller, navigationAction) async {
              var uri = navigationAction.request.url!;
              if (![
                "http",
                "https",
                "file",
                "chrome",
                "data",
                "javascript",
                "about"
              ].contains(uri.scheme)) {
                if (await canLaunchUrl(uri)) {
                  // Launch the App
                  await launchUrl(
                    uri,
                  );
                  // and cancel the request
                  return NavigationActionPolicy.CANCEL;
                }
              }

              return NavigationActionPolicy.ALLOW;
            },

          ),
          isLoading
              ? Center(child: CustomProgressIndicator())
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}