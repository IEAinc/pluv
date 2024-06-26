import 'dart:io';
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

  int testInt = 0;

  void plusInt(){
    testInt++;
    update();
  }

  ///로그인

  //로그인
  Future<bool> login(String email ,String password) async{

    try{
      MemberVo memberVo = await myFirebaseService.signInWithEmailAndPassword(email, password);

      if(memberVo.activeState==3){
        return false;
      }else{
        myInfo = memberVo;
        update();
        await prefs.setString('myEmail', email);
        await prefs.setString('myPassword', password);
        return true;
      }

    }catch(error){
      throw error;

    }
  }

  //오토로그인
  Future<bool> autoLogin() async{

    String? email =  prefs.getString('myEmail');
    String? password = prefs.getString('myPassword');

    if(email ==null || password ==null){
      return false;
    }

    try{
      return login(email,password);

    }catch(error){
      await prefs.remove('myEmail');
      await prefs.remove('myPassword');
      throw Exception('Error : $error');
    }
  }

  //로그아웃
  Future<void> logout() async{
    try{
      myInfo = null;
      await myFirebaseService.logout();
      update();
      await prefs.remove('myEmail');
      await prefs.remove('myPassword');

    }catch(error){
      throw Exception('Error : $error');
    }
  }

  ///멤버등록

  //회원가입
  Future<void> addMember(MemberVo memberVo) async{

    try{
      await myFirebaseService.signUpWithEmailAndPassword(memberVo);
    }catch(error){

      throw error;
    }

  }


  //내정보 업데이트
  Future<void> updateMember() async{
    try{
      myInfo = await myFirebaseService.updateMember(myInfo!);
      update();
    }catch(error){
      throw error;
    }

  }

  //프로필 이미지 업로드
  Future<void> uploadProfileImage(List<dynamic> list) async{
    try{
      List<String> profileImageList =[];
      for (var item in list) {
        if (item is File) {
          String url = await myFirebaseService.imageUpload("profileImage", myInfo!.memberUid!, item);
          profileImageList.add(url);
        } else {
          profileImageList.add(item);
        }
      }
      myInfo!.profileImageList = profileImageList;
      myInfo!.profileStatus!.step3 = true;
      myInfo = await myFirebaseService.updateMember(myInfo!);
      update();
    }catch(error){
      throw error;
    }
  }


  //서류 이미지 업로드
  Future<void> uploadPaperImage(String paperCode,List<dynamic> list) async{
    try{
      List<String> paperImageList =[];
      for (var item in list) {
        if (item is File) {
          String url = await myFirebaseService.imageUpload("paperImage", myInfo!.memberUid!+"_"+paperCode , item);
          paperImageList.add(url);
        } else {
          paperImageList.add(item);
        }
      }

      PaperInfoVo paperInfoVo = PaperInfoVo();
      paperInfoVo.paperCode = paperCode;
      paperInfoVo.certificate = false;
      paperInfoVo.imageList = paperImageList;

      int index = myInfo!.paperInfo!.indexWhere((element) => element.paperCode == paperCode);

      if (index != -1) {
        // Update the existing PaperInfoVo
        myInfo!.paperInfo![index] = paperInfoVo;
      } else {
        // Add a new PaperInfoVo if not found
        myInfo!.paperInfo!.add(paperInfoVo);
      }

      myInfo!.profileStatus!.step4 = true;
      myInfo = await myFirebaseService.updateMember(myInfo!);
      update();
    }catch(error){
      throw error;
    }
  }

  ///체킹

  //폰 중복확인
  Future<bool> checkPhoneDuplicate(String name ,String phone) async{
    try{
      bool result = await myFirebaseService.checkPhoneDuplicate(name,phone);
        return result;
    }catch(error){
      throw error;
    }
  }

  //DI 중복확인
  Future<bool> checkDiDuplicate(String di) async{
    try{
      bool result = await myFirebaseService.checkDiDuplicate(di);
      return result;
    }catch(error){
      throw error;
    }
  }
  //닉네임
  Future<bool> checkNickNameDuplicate(String nickName) async{
    try{
      bool result = await myFirebaseService.checkNickNameDuplicate(nickName);
      return result;
    }catch(error){
      throw error;
    }
  }

  //이메일 중복확인
  Future<bool> checkEmailDuplicate(String email) async{
    try{
      bool result = await myFirebaseService.checkEmailDuplicate(email);
      return result;
    }catch(error){
      throw error;
    }
  }

}