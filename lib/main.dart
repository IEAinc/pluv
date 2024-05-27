import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 전체적인 앱의 기본 폰트를 Noto Sans CJK KR 로 설정
        textTheme: GoogleFonts.notoSansKrTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: const MainPage(),
    );
  }
}
