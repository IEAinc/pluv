import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/pages/main/main_page.dart';
import 'package:pluv/pages/start/login_page.dart';
import 'package:pluv/pages/start/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/auth_controller.dart';
import 'controller/data_controller.dart';
import 'controller/status_controller.dart';
import 'firebase_options.dart';
import 'global/global.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //파이어베이스
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  Get.put(StatusController());
  Get.put(DataController());
  Get.put(AuthController());
  StatusController _statusController = Get.find<StatusController>();
  AuthController _authController = Get.find<AuthController>();
  await _statusController.getAppInfo();
  bool? onBoarding =  prefs.getBool('onBoarding');
  if(onBoarding == true){
    try{
      bool success = await _authController.autoLogin();
      if(success){
        mode = 1;
      }else{
        mode = 2;
      }
    }catch(e){
      mode = 2;
    }
  }else{
    mode = 3;
  }
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

int mode = 3;

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // 전체적인 앱의 기본 폰트를 Pretendard 로 설정
        fontFamily: 'Pretendard',
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white)

      ),
      home: mode==1?MainPage(initialPage: 0,):mode==2?LoginPage():OnboardingPage()
    );
  }
}
