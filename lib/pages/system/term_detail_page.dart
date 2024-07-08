import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';

///TermDetailPage
///담당자 : saran
///설명 : 약관페이지

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
    //pdf부르기
    loadPdf();
  }

  String? pdfFlePath;

  //url로 pdf약관이 올라가있는 곧에 접근하여 정보를 얻은다음 다운로드하여 file로 만들고 그걸 PdfView로 보여줌
  Future<String> downloadAndSavePdf() async {

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    final response = await http.get(Uri.parse(widget.url));
    logger.e(response);
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "약관"),
      body: Column(
        children: [
          pdfFlePath==null?Expanded(
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: Center(child: CustomProgressIndicator()),
            ),
          ):
          Expanded(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: PdfView(path: pdfFlePath!),
            ),
          )

        ],
      ),
    );
  }
}
