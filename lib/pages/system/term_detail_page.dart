import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global/global.dart';

///TermDetailPage
///담당자 : ---

class TermDetailPage extends StatefulWidget {
  final String url;

  const TermDetailPage({Key? key , required this.url}) : super(key: key);

  @override
  State<TermDetailPage> createState() => _TermDetailPageState();
}

class _TermDetailPageState extends State<TermDetailPage> {

  @override
  void initState() {
    super.initState();
    logger.i("TermDetailPage");

    setState(() {
      url = widget.url;
    });
  }

  String url = "";
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
      appBar: customAppBar(title: "약관"),
      body: Expanded(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(url)),
          initialSettings: settings,
          onWebViewCreated: (controller) {
            webViewController = controller;},
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
      ),
    );
  }
}
