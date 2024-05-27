import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/pages/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/status_controller.dart';
import 'firebase_options.dart';
import 'global.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //파이어베이스
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  Get.put(StatusController());
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
