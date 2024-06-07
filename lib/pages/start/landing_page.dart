import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../main/main_page.dart';

///LandingPage
///담당자 : ---

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    logger.i("LandingPage");

    //오토로그인 시도
    //성공시 메인
    //실패시 로그인페이지
    getInit();
  }

  void getInit() async{
    Timer(const Duration(milliseconds: 2000),() async{

      bool success = await _authController.autoLogin();
      if(success){
        Get.offAll(MainPage());
      }else{
        //일단
        Get.offAll(MainPage());
      }
    });


  }

  AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image.asset("assets/images/pluvlogo.png",width: 100,),
        )
    );
  }




}
