import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/pages/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/status_controller.dart';
import 'firebase_options.dart';
import 'global/global.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //파이어베이스
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  Get.put(StatusController());
  StatusController _statusController = Get.find<StatusController>();
  _statusController.getAppInfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // 전체적인 앱의 기본 폰트를 Pretendard 로 설정
        fontFamily: 'Pretendard',
      ),
      home: const MainPage(),
    );
  }
}
