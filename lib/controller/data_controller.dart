import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pluv/model/vo/lounge_vo.dart';


import '../global/global.dart';
import '../global/my_firebase_service.dart';
import '../model/dto/lounge_dto.dart';
import '../model/vo/comment_vo.dart';

///DataController
///담당자 : saran

class DataController extends GetxController {
  final MyFirebaseService myFirebaseService = MyFirebaseService();



  ///라운지 리스트 조회
  //빅쿼리에서
  Future<Map<String,dynamic>> searchLoungeList({required bigQuery,required String categoryType, String? keyword,required int page,DocumentSnapshot? lastDocument}) async{
    // bigQuery -> true->function 통해 빅쿼리호출, false ->firestore에서 직접 가져옴
    // categoryType -> ""(전체) , best(베스트), 나머지는 카테고리 코드
    // keyword -> 검색어
    // page -> 페이징, 0이 디폴트
    try{
      Map<String,dynamic> data = await myFirebaseService.searchLoungeList(bigQuery,categoryType,keyword??"",page,lastDocument);
      return data;
    }catch(error){
      throw Exception('Error : $error');
    }
  }


  ///라운지 등록
  Future<void> addLounge(LoungeVo loungeVo) async{
    try{
      await myFirebaseService.addLounge(loungeVo);
    }catch(error){
      throw Exception('Error : $error');
    }
  }

  ///댓글 등록
  Future<void> addComment(CommentVo commentVo) async{
    try{
      await myFirebaseService.addComment(commentVo);
    }catch(error){
      throw Exception('Error : $error');
    }
  }


}