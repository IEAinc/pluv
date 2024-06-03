import 'dart:math';

import 'package:get/get.dart';


import '../global/global.dart';
import '../global/my_firebase_service.dart';
import '../model/vo/appInfo_vo.dart';

///StatusController
///담당자 : saran

class StatusController extends GetxController {
  final MyFirebaseService myFirebaseService = MyFirebaseService();

  AppInfoVo appInfo = AppInfoVo();
  ///앱인포
  Future<void> getAppInfo() async{
    try{
      appInfo = await myFirebaseService.getAppInfo();
      update();
    }catch(error){
      throw Exception('Error : $error');
    }
  }

  void getdd(){
    logger.e("hi");
  }





}