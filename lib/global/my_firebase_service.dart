import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pluv/model/vo/lounge_vo.dart';
import 'package:pluv/model/vo/member_vo.dart';
import 'package:pluv/model/vo/request_approval_vo.dart';

import '../model/dto/lounge_dto.dart';
import '../model/vo/admin_vo.dart';
import '../model/vo/appInfo_vo.dart';
import '../model/vo/comment_report_vo.dart';
import '../model/vo/comment_vo.dart';
import '../model/vo/community_report_vo.dart';
import 'global.dart';




///MyFirebaseService
///담당자 : saran


FirebaseFirestore firestore = FirebaseFirestore.instance;
// Firebase Auth 인증 서비스 가져오기
final FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
FirebaseFunctions functions = FirebaseFunctions.instanceFor(region: 'us-central1'); //아이오와
FirebaseMessaging messaging = FirebaseMessaging.instance;
CollectionReference masterCollection = firestore.collection('MASTER');
CollectionReference loungeCollection = firestore.collection('COMMUNITY_LOUNGE');
CollectionReference commentCollection = firestore.collection('COMMUNITY_COMMENT');
CollectionReference memberCollection = firestore.collection('MEMBER');
CollectionReference requestMemberApprovalCollection = firestore.collection('REQUEST_MEMBER_APPROVAL');
CollectionReference adminCollection = firestore.collection('ADMIN');

CollectionReference communityReportCollection = firestore.collection('COMMUNITY_REPORT');
CollectionReference commentReportCollection = firestore.collection('COMMENT_REPORT');




class MyFirebaseService{

  ///----앱정보 -----

  Future<AppInfoVo> getAppInfo() async {
    try {
      // DocumentSnapshot documentSnapshot = await masterCollection.doc('system').get();
      DocumentSnapshot documentSnapshot = await masterCollection.doc('system_v2').get();

      return AppInfoVo.fromSnapshot(documentSnapshot);
    } catch (error) {
      throw Exception('Error : $error');
    }
  }



  ///----멤버 ----

  //로그인
  Future<MemberVo> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? memberUid = userCredential.user?.uid;
      //사용자 fcmToken 최신화
      String? token = await messaging.getToken();
      await memberCollection.doc(memberUid).update({
        'fcmToken': token,
      });
      //사용자 가져오기
      DocumentSnapshot documentSnapshot = await memberCollection.doc(memberUid).get();

      return MemberVo.fromSnapshot(documentSnapshot);
    } catch (error) {

      if (error is FirebaseAuthException) {

        if (error.code == 'INVALID_LOGIN_CREDENTIALS') {
          throw '계정정보를 찾을 수 없습니다. 이메일,비밀번호를 확인해주세요.';
        }

      }else{


        throw error;
      }
      throw error;
    }
  }


  //오토로그인
  Future<MemberVo?> autoLogin() async {
    try {


      if(auth.currentUser ==null){
        return null;
      }
      String? memberUid = auth.currentUser?.uid;
      //사용자 fcmToken 최신화
      String? token = await messaging.getToken();
      await memberCollection.doc(memberUid).update({
        'fcmToken': token,
      });
      //사용자 가져오기
      DocumentSnapshot documentSnapshot = await memberCollection.doc(memberUid).get();

      return MemberVo.fromSnapshot(documentSnapshot);
    } catch (error) {

      if (error is FirebaseAuthException) {

        if (error.code == 'INVALID_LOGIN_CREDENTIALS') {
          throw '계정정보를 찾을 수 없습니다. 이메일,비밀번호를 확인해주세요.';
        }

      }else{
        throw error;
      }
      throw error;
    }
  }


  //로그아웃
  Future<void> logout() async {

    try {
      auth.signOut();
    } catch (error) {
      throw error;
    }

  }


  ///----유저-------

  // 사용자 이메일 및 비밀번호로 가입
  Future<void> signUpWithEmailAndPassword(MemberVo memberVo) async {

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: memberVo!.memberEmail!,
        password: memberVo!.memberPassword!,
      );
      // 가입 성공 시 사용자의 UID 가져오기
      String? memberUid = userCredential.user?.uid;

      // 문서 참조를 만들고 자동으로 생성된 문서 ID를 가져옴
      final DocumentReference docReference = memberCollection.doc(memberUid);
      String? token = await messaging.getToken();

      memberVo.memberUid = memberUid;
      memberVo.fcmToken = token;

      await docReference.set(memberVo.toJson());


    } catch (error) {
      logger.e(error);
      // 가입 실패 시 예외 처리
      if (error is FirebaseAuthException) {

        if (error.code == 'email-already-in-use') {
          throw '이미 가입되어있는 이메일 입니다.';
        }

      }else{

        throw error;
      }

    }

  }

  //유저 업데이트
  Future<MemberVo> updateMember(MemberVo memberVo) async {

    try {
      await memberCollection.doc(memberVo.memberUid).update(memberVo.toJson());
      //사용자 가져오기
      DocumentSnapshot documentSnapshot = await memberCollection.doc(memberVo.memberUid).get();
      return MemberVo.fromSnapshot(documentSnapshot);
    } catch (error) {
      throw error;
    }

  }

  //심사요청
  Future<MemberVo> requestMemberApproval(RequestApprovalVo request) async {
    try {
      // 트랜잭션 시작
      await firestore.runTransaction((transaction) async {
        // 심사 요청 컬렉션에서 문서 참조 가져오기
        final DocumentReference docReference = requestMemberApprovalCollection.doc(request.memberUid);
        transaction.set(docReference, request.toJson());
        transaction.update(memberCollection.doc(request.memberUid), {
          "memberStatus": 2,
          "screeningDivision": request.screeningDivision
        });
      });

      DocumentSnapshot documentSnapshot = await memberCollection.doc(request.memberUid).get();

      return MemberVo.fromSnapshot(documentSnapshot);
    } catch (error) {
      throw error;
    }

  }


  //내 어드민 정보 호출
  Future<AdminVo?> getMyAdmin(String? uid) async {
    try {
      DocumentSnapshot documentSnapshot = await adminCollection.doc(uid).get();
      if(documentSnapshot.exists){
        return AdminVo.fromSnapshot(documentSnapshot);
      }
    } catch (error) {
      logger.e(error);
      throw error;
    }

  }







  ///중복확인
  // 유저 폰 중복 존재 확인
  Future<bool> checkPhoneDuplicate(String name , String phone) async{
    try {
      final querySnapshot = await memberCollection
          .where('memberPhone', isEqualTo: phone)
          .where('memberName', isEqualTo: name)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        //1명 이상있으면 true
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //에러시 있다고 가정
      return true; // Handle error case
    }
  }

  // 유저 di 중복 존재 확인
  Future<bool> checkDiDuplicate(String di) async{
    try {
      final querySnapshot = await memberCollection
          .where('memberDi', isEqualTo: di)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        //1명 이상있으면 true
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //에러시 있다고 가정
      return true; // Handle error case
    }
  }

  // 유저 닉네임 중복 존재 확인
  Future<bool> checkNickNameDuplicate(String nickName) async{
    try {
      final querySnapshot = await memberCollection
          .where('nickName', isEqualTo: nickName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        //1명 이상있으면 true
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //에러시 있다고 가정
      return true; // Handle error case
    }
  }

  // 이메일 중복 존재 확인
  Future<bool> checkEmailDuplicate(String email) async{
    try {
      final querySnapshot = await memberCollection
          .where('memberEmail', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        //1명 이상있으면 true
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //에러시 있다고 가정
      return true; // Handle error case
    }
  }



  ///----라운지 -----

  //라운지 리스트 불러오기
  Future<Map<String,dynamic>> searchLoungeList(bigQuery,categoryType,keyword,page,DocumentSnapshot? lastDocument) async {

    Map<String,dynamic> valueModel = {
      "loungeList" :[],
      "lastDocument":null
    };

    try {
      Map<String,dynamic> searchMap = {
        "categoryType" : categoryType,
        "searchKey" : keyword,
        "limit" : maxLimit,
        "page" : page,
      };
      List<LoungeVo> loungeList = <LoungeVo>[];
      if(bigQuery){
        final HttpsCallableResult result = await functions
            .httpsCallable("searchLoungeList")
            .call(<String, dynamic>{'searchMap': searchMap});
        result.data["result"].forEach((v) {
          LoungeVo item = LoungeVo.fromJson(v);
          loungeList!.add(item);
        });
        valueModel["loungeList"] = loungeList;

        return valueModel;

      }else{

        Query query = loungeCollection
            .where("loungeStatus" , isEqualTo: 1)
            .orderBy('loungeCreateDate', descending: true)
            .limit(maxLimit);
        if (categoryType == "전체" ||  categoryType == "best") {
        }else{
          query = query.where("loungeCategoryCode" , isEqualTo: categoryType);
        }
        if (categoryType == "best") {
          query = query.where("best" , isEqualTo: true);
        }

        if (lastDocument != null ) {
          query = query.startAfterDocument(lastDocument);
        }
        QuerySnapshot querySnapshot = await query.get();
        if(querySnapshot.docs.isEmpty){
          valueModel["loungeList"] = null;
          valueModel["lastDocument"] = lastDocument;
        }else{
          for (DocumentSnapshot document in querySnapshot.docs) {
            loungeList.add(LoungeVo.fromSnapshot(document));
          }
          valueModel["loungeList"] = loungeList;
          valueModel["lastDocument"] = querySnapshot.docs.last;
        }


        return valueModel;
      }




    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //라운지 1개불러오기
  Future<LoungeVo> getLounge(String loungeKey) async {
    try {

      DocumentSnapshot documentSnapshot = await loungeCollection.doc(loungeKey).get();

      if(documentSnapshot.get("loungeStatus")!=1){
        throw Exception('삭제 또는 차단된 컨텐츠');
      }
      return LoungeVo.fromSnapshot(documentSnapshot);

    } catch (error) {
      throw Exception(error);
    }
  }


  //라운지 게시글 등록
  Future<void> addLounge(LoungeVo loungeVo) async {
    try {

      final DocumentReference docReference = loungeCollection.doc();
      String docId = docReference.id;
      loungeVo.loungeKey = docId;
      await docReference.set(loungeVo.toJson());

    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //라운지 게시글 업데이트
  Future<void> updateLounge(LoungeVo loungeVo) async {
    try {

      await loungeCollection.doc(loungeVo.loungeKey).update(loungeVo.toJson());


    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //라운지 논리삭제
  Future<void> removeLounge(String key) async {
    try {

      DocumentReference docRef = loungeCollection.doc(key);

      return docRef.update({
        'loungeStatus': 3
      });



    } catch (error) {
      throw Exception('Error : $error');
    }
  }


  //라운지 댓글 등록
  Future<void> addComment(CommentVo commentVo) async {
    try {

      final DocumentReference docReference = commentCollection.doc();
      String docId = docReference.id;
      commentVo.commentKey = docId;


      // 트랜잭션 시작
      await firestore.runTransaction((transaction) async {
        //댓글등록
        transaction.set(docReference, commentVo.toJson());
        //커뮤니티글에 댓글정보 추가 (갯수수집을 위함)
        if(commentVo.replyDepth==1){
          transaction.update(loungeCollection.doc(commentVo.targetCommunityKey), {
            'commentList': FieldValue.arrayUnion([commentVo.commentKey]),
          });
        }
        if(commentVo.replyDepth==2){
          transaction.update(loungeCollection.doc(commentVo.targetCommunityKey), {
            'comment2List': FieldValue.arrayUnion([commentVo.commentKey]),
          });
          //1번댓글에도 넣어줌
          transaction.update(commentCollection.doc(commentVo.upperReplyKey), {
            'underCommentList': FieldValue.arrayUnion([commentVo.commentKey]),
          });
        }
      });


    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //라운지 댓글 논리삭제
  Future<void> removeComment(String key) async {
    try {
      DocumentReference docRef = commentCollection.doc(key);
      return docRef.update({
        'commentStatus': 3
      });
    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //라운지 댓글 수정
  Future<void> updateComment(CommentVo commentVo,String newComment) async {
    try {
      DocumentReference docRef = commentCollection.doc(commentVo.commentKey);
      return docRef.update({

        ...commentVo.toJson(),
        "commentDescription":newComment,
        "commentUpdateDate":Timestamp.now()
      });
    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //댓글 얻기
  Future<Map<String,dynamic>> getCommentList(
      String communityKey,
      String upperReplyKey ,
      int replyDepth,
      DocumentSnapshot? lastDocument) async {
    Map<String,dynamic> valueModel = {
      "commentList" :[],
      "lastDocument":null
    };
    List<CommentVo> commentList = <CommentVo>[];
    try {

      Query query = commentCollection
          .where("targetCommunityKey" , isEqualTo: communityKey)
          .where("commentStatus" , isEqualTo: 1)
          .where("upperReplyKey" , isEqualTo: upperReplyKey)
          .where("replyDepth" , isEqualTo: replyDepth)
          .orderBy('commentCreateDate', descending: true)
          .limit(maxLimit);

      if (lastDocument != null ) {
        query = query.startAfterDocument(lastDocument);
      }
      QuerySnapshot querySnapshot = await query.get();
      if(querySnapshot.docs.isEmpty){
        valueModel["commentList"] = null;
        valueModel["lastDocument"] = lastDocument;
      }else{
        for (DocumentSnapshot document in querySnapshot.docs) {
          commentList.add(CommentVo.fromSnapshot(document));
        }
        valueModel["commentList"] = commentList;
        valueModel["lastDocument"] = querySnapshot.docs.last;
      }

      return valueModel;

    } catch (error) {
      throw Exception('Error : $error');
    }
  }


  //라운지 like 등록,제거
  Future<void> updateLoungeLike(String loungeKey,String userUid,bool add ) async {
    try {
      DocumentReference docRef = loungeCollection.doc(loungeKey);

      return docRef.update({
        'likeList': add?FieldValue.arrayUnion([userUid]):FieldValue.arrayRemove([userUid])
      });

    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //커뮤니티 신고리포트
  Future<void> reportCommunity(CommunityReportVo communityReportVo) async {
    try {

      final DocumentReference docReference = communityReportCollection.doc();
      String docId = docReference.id;
      communityReportVo.communityReportKey = docId;
      await docReference.set(communityReportVo.toJson());

    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //댓글 신고리포트
  Future<void> reportComment(CommentReportVo commentReportVo) async {
    try {

      final DocumentReference docReference = commentReportCollection.doc();
      String docId = docReference.id;
      commentReportVo.commentReportKey = docId;
      await docReference.set(commentReportVo.toJson());

    } catch (error) {
      throw Exception('Error : $error');
    }
  }


  ///공통

  //이미지 업로드
  Future<String> imageUpload(String folderName, String title,File file) async {
    try{


      Reference ref = storage.ref("${folderName}/${title}_${DateFormat('yyyyMMdd').format(DateTime.now())}_${generateRandomString(5)}.${file.path.split('.').last}");
      await ref.putFile(file);
      final String _urlString = await ref.getDownloadURL();
      return _urlString;
    }catch(error){
      throw Exception(error);
    }
  }

  ///function 테스트

  //라운지 리스트 불러오기
  void functionTest() async {
    try {

      final HttpsCallableResult result = await functions.httpsCallable("saantest")
          .call(<String, dynamic>{'searchMap': ""});

      logger.i(result);
      logger.e(result.data["result"]);

    } catch (error) {
      throw Exception('Error : $error');
    }
  }

}


