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
import '../model/vo/comment_vo.dart';
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



class MyFirebaseService{

  ///----앱정보 -----

  Future<AppInfoVo> getAppInfo() async {
    try {
      DocumentSnapshot documentSnapshot = await masterCollection.doc('system').get();
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
  Future<List<LoungeDto>> searchLoungeList(categoryType,keyword,page) async {
    try {

      Map<String,dynamic> searchMap = {
        "categoryType" : categoryType,
        "searchKey" : keyword,
        "limit" : 20,
        "page" : page,
      };
      List<LoungeDto> loungeList = <LoungeDto>[];
      final HttpsCallableResult result = await functions
          .httpsCallable("searchLoungeList")
          .call(<String, dynamic>{'searchMap': searchMap});



      result.data["result"].forEach((v) {

        LoungeDto item = LoungeDto();
        item.loungeVo = LoungeVo.fromJson(v);
        item.commentCount = v['commentCount'];
        item.writerGender = v['memberGender'] == "true"?true:false;

        loungeList!.add(item);
      });


      return loungeList;


    } catch (error) {
      throw Exception('Error : $error');
    }
  }


  //라운지 게시글 등록
  Future<void> addLounge(LoungeVo loungeVo) async {
    try {
      // AuthController authController = Get.find<AuthController>();
      // if(authController.myInfo==null){
      //   throw Exception('No auth');
      // }

      final DocumentReference docReference = loungeCollection.doc();
      String docId = docReference.id;
      loungeVo.loungeKey = docId;
      // loungeVo.writerUid = authController.myInfo!.docId;


      await docReference.set(loungeVo.toJson());


    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  //라운지 댓글 등록
  Future<void> addComment(CommentVo commentVo) async {
    try {
      // AuthController authController = Get.find<AuthController>();
      // if(authController.myInfo==null){
      //   throw Exception('No auth');
      // }

      final DocumentReference docReference = commentCollection.doc();
      String docId = docReference.id;
      commentVo.commentKey = docId;
      // loungeVo.writerUid = authController.myInfo!.docId;


      await docReference.set(commentVo.toJson());


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


