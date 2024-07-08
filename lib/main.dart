import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
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
  //파이어베이스 세팅
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //처음에 prefs를 세팅함. 이건 global에 만들어둠
  prefs = await SharedPreferences.getInstance();
  //겟엑스 컨트롤러들 의존성 등록 및 주입
  Get.put(StatusController());
  Get.put(DataController());
  Get.put(AuthController());
  StatusController _statusController = Get.find<StatusController>();
  AuthController _authController = Get.find<AuthController>();
  //앱 정보 가져오기
  await _statusController.getAppInfo();
  //온보딩을 보여줄것인지 여부를 판단하는건데 앱 깔고 처음인사람만 온보딩 보여주기위함
  bool? onBoarding =  prefs.getBool('onBoarding');

  if(onBoarding == true){
    try{
      //자동 로그인 시도
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

// 1: 앱 처음은 아닌데 오토로그인이 아니라 로그인페이지로 가야함
// 2: 오토로그인 성공이라 메인페이지로 가야함.
// 3: 앱처음이라서 온보딩으로 가야함
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
