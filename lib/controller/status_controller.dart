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

  //지역구만 뽑아내기
  List<CodeInfoVo> getArea() {

    List<CodeInfoVo> entries = appInfo.areaCode!.where((entry) => entry.etc!.contains("01")).toList();
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

      int indexA = order.indexOf(a.code!);
      int indexB = order.indexOf(b.code!);
      if (indexA == -1) indexA = order.length; // 나머지 항목은 마지막으로
      if (indexB == -1) indexB = order.length;
      return indexA.compareTo(indexB);
    });
    return entries;
  }

  //지역구 상세 뽑아내기
  List<CodeInfoVo> getAreaDetail(String area) {
    List<CodeInfoVo> entries = appInfo.areaCode!.where((entry) => entry.upperCode!.contains(area)).toList();
    return entries;
  }



  //코드에서 title 뽑아내기
  String findTitleByCode(List<CodeInfoVo> list, String codeToFind) {
    try {
      CodeInfoVo result = list.firstWhere((obj) => obj.code == codeToFind, orElse: () => CodeInfoVo(code: "", title: ""));
      return result.title!;
    } catch (e) {
      return "";
    }
  }

  //코드에서 title list 뽑아내기
  List<String> findTitleListByCode(List<CodeInfoVo> list, List<dynamic> codeToFind) {
    try {
      List<String> titleList = [];

      for(var item in codeToFind){
        CodeInfoVo result = list.firstWhere((obj) => obj.code == item, orElse: () => CodeInfoVo(code: "", title: ""));
        titleList.add(result.title!);
      }

      return titleList;
    } catch (e) {
      return [];
    }
  }




}