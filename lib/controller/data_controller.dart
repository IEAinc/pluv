import 'dart:math';

import 'package:get/get.dart';


import '../global/global.dart';
import '../global/my_firebase_service.dart';
import '../model/dto/lounge_dto.dart';

///DataController
///담당자 : saran

class DataController extends GetxController {
  final MyFirebaseService myFirebaseService = MyFirebaseService();



  ///라운지 리스트 조회
  // Future<List<LoungeDto>> getLoungeList({required String type, String? keyword,required int page}) async{
  //   // type -> ""(전체) , best(베스트), 나머지는 카테고리 코드
  //   // keyword -> 검색어
  //   // page -> 페이징, 0이 디폴트
  //   try{
  //     List<LoungeDto> data = await myFirebaseService.getLoungeList(type,keyword??"",page);
  //     return data;
  //   }catch(error){
  //     throw Exception('Error : $error');
  //   }
  // }

  void getdd(){
    logger.e("hi");
  }





}