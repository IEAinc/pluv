import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pluv/model/vo/comment_report_vo.dart';
import 'package:pluv/model/vo/community_report_vo.dart';
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

  ///라운지 1개 조회
  Future<LoungeVo> getLounge(String loungeKey) async{
    try{
      return await myFirebaseService.getLounge(loungeKey);
    }catch(error){
      throw Exception(error);
    }
  }

  ///라운지 등록
  Future<void> addLounge(LoungeVo loungeVo) async{
    try{
      List<String> imageList =[];
      for (var item in loungeVo.loungeImageList!) {
        if (item is File) {
          String url = await myFirebaseService.imageUpload("loungeImage", loungeVo!.writerUid!+"_"+generateRandomString(7) , item);
          imageList.add(url);
        } else {
          imageList.add(item);
        }
      }
      loungeVo.loungeImageList = imageList;
      await myFirebaseService.addLounge(loungeVo);



    }catch(error){
      throw Exception('Error : $error');
    }
  }


  ///라운지 수정
  Future<void> updateLounge(LoungeVo loungeVo) async{
    try{
      List<String> imageList =[];
      for (var item in loungeVo.loungeImageList!) {
        if (item is File) {
          String url = await myFirebaseService.imageUpload("loungeImage", loungeVo!.writerUid!+"_"+generateRandomString(7) , item);
          imageList.add(url);
        } else {
          imageList.add(item);
        }
      }
      loungeVo.loungeImageList = imageList;
      loungeVo.loungeUpdateDate = Timestamp.now();
      await myFirebaseService.updateLounge(loungeVo);



    }catch(error){
      throw Exception('Error : $error');
    }
  }




  ///라운지 논리삭제
  Future<void> removeLounge(String key) async{
    try{
      await myFirebaseService.removeLounge(key);
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

  ///댓글 논리삭제
  Future<void> removeComment(String key) async{
    try{
      await myFirebaseService.removeComment(key);
    }catch(error){
      throw Exception('Error : $error');
    }
  }

  ///댓글 수정
  Future<void> updateComment(CommentVo commentVo, String newComment) async{
    try{
      await myFirebaseService.updateComment(commentVo , newComment);
    }catch(error){
      throw Exception('Error : $error');
    }
  }



  ///댓글 리스트 호출
  Future<Map<String,dynamic>> getCommentList(String communityKey, String upperReplyKey , int replyDepth, DocumentSnapshot? lastDocument) async{
    try{
      Map<String,dynamic> data = await myFirebaseService.getCommentList(communityKey,upperReplyKey,replyDepth,lastDocument);
      return data;
    }catch(error){
      throw Exception('Error : $error');
    }

  }

  ///라운지 like 추가/제거
  Future<void> updateLoungeLike(String loungeKey , String userUid, bool add) async{
    try{
      await myFirebaseService.updateLoungeLike(loungeKey , userUid, add);
    }catch(error){
      throw Exception('Error : $error');
    }
  }


  ///라운지/파티 신고 리포트
  Future<void> reportCommunity(CommunityReportVo communityReportVo) async{
    try{
      await myFirebaseService.reportCommunity(communityReportVo);
    }catch(error){
      throw Exception('Error : $error');
    }
  }

  ///댓글 신고 리포트
  Future<void> reportComment(CommentReportVo commentReportVo) async{
    try{
      await myFirebaseService.reportComment(commentReportVo);
    }catch(error){
      throw Exception('Error : $error');
    }
  }


}