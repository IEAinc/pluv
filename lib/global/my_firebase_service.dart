import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../model/vo/appInfo_vo.dart';




///MyFirebaseService
///담당자 : saran


FirebaseFirestore firestore = FirebaseFirestore.instance;
// Firebase Auth 인증 서비스 가져오기
final FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
FirebaseFunctions functions = FirebaseFunctions.instanceFor(region: 'asia-northeast3');

CollectionReference masterCollection = firestore.collection('MASTER');



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

  ///----라운지 -----

  Future<AppInfoVo> getLoungeList(type,keyword,page) async {
    try {
      DocumentSnapshot documentSnapshot = await masterCollection.doc('system').get();
      return AppInfoVo.fromSnapshot(documentSnapshot);
    } catch (error) {
      throw Exception('Error : $error');
    }
  }


}


