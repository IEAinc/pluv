import 'dart:math';

import 'package:get/get.dart';
import 'package:pluv/model/vo/lounge_vo.dart';
import 'package:pluv/model/vo/member_vo.dart';


import '../global/global.dart';
import '../global/my_firebase_service.dart';
import '../model/dto/lounge_dto.dart';

///AuthController
///담당자 : saran

class AuthController extends GetxController {
  final MyFirebaseService myFirebaseService = MyFirebaseService();

  MemberVo? myInfo;


  ///멤버등록
  Future<void> addMember(MemberVo memberVo) async{

    try{
      await myFirebaseService.signUpWithEmailAndPassword(memberVo);
    }catch(error){

      throw error;
    }

  }


}