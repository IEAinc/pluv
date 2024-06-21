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
      appInfo.makeEntry();
      update();
    }catch(error){
      throw Exception('Error : $error');
    }
  }

  //지역구만 뽑아내기
  List<MapEntry<String, dynamic>> getArea() {

    List<MapEntry<String, dynamic>> entries = appInfo.areaCodeEntryList!.where((entry) => entry.key.contains("00")).toList();
    entries.sort((a, b) {
      const order = [
        'RE_GU_SE_00',
        'RE_GU_GY_00',
        'RE_GU_IN_00',
        'RE_GU_CH_00',
        'RE_GU_GW_00',
        'RE_GU_JR_00',
        'RE_GU_GS_00',
        'RE_GU_JJ_00'
      ];

      int indexA = order.indexOf(a.key);
      int indexB = order.indexOf(b.key);
      if (indexA == -1) indexA = order.length; // 나머지 항목은 마지막으로
      if (indexB == -1) indexB = order.length;
      return indexA.compareTo(indexB);
    });
    return entries;
  }

  //지역구 상세 뽑아내기
  List<MapEntry<String, dynamic>> getAreaDetail(String area) {
    List<MapEntry<String, dynamic>> entries = appInfo.areaCodeEntryList!.where((entry) => entry.key.contains(area.substring(0, 8)) && !entry.key.contains("00")).toList();
    return entries;
  }





}