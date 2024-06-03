import 'package:cloud_firestore/cloud_firestore.dart';

class AppInfoVo {

  String? appName; // 앱이름
  AppVersionVo?	appVersion; // 버전
  BuildVersionVo?	buildVersion; // 빌드버전
  String? serviceLink; // 서비스이용약관링크
  String? privacyLink; // 개인정보 보호정책 링크
  String? promotionLink; // 홍보 및 마케팅 링크
  String? adLink; // 광고성 정보 수신동의서 링크
  String? businessNumber; // 사업자번호
  List<CodeVo>?	bodyFormCode; // 체형코드
  List<CodeVo>?	drinkCode; // 음주코드
  List<CodeVo>?	religionCode; // 종교코드
  List<CodeVo>?	personalityCode; // 성격코드
  List<CodeVo>?	interestCode; // 관심코드
  List<CodeVo>?	attractionCode; // 매력코드
  List<CodeVo>?	dateStyleCode; // 데이트스타일코드
  List<CodeVo>?	areaCode; // 지역구코드
  List<CodeVo>?	pointCode; // 포인트코드
  List<CodeVo>?	adminAccessCode; // 관리자접근권한코드
  List<CodeVo>?	loungeCategoryCode; // 라운지카테고리코드
  List<CodeVo>?	communityReportCode; // 커뮤니티신고코드
  List<CodeVo>?	partyCategoryCode; // 파티카테고리코드
  
  AppInfoVo({
    this.appName,
    this.appVersion,
    this.buildVersion,
    this.serviceLink,
    this.privacyLink,
    this.promotionLink,
    this.adLink,
    this.businessNumber,
    this.bodyFormCode,
    this.drinkCode,
    this.religionCode,
    this.personalityCode,
    this.interestCode,
    this.attractionCode,
    this.dateStyleCode,
    this.areaCode,
    this.pointCode,
    this.adminAccessCode,
    this.loungeCategoryCode,
    this.communityReportCode,
    this.partyCategoryCode,
  }); 

  AppInfoVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    appName = data['appName']??"";
    appVersion = AppVersionVo.fromJson(data['appVersion']);
    buildVersion = BuildVersionVo.fromJson(data['buildVersion']);
    serviceLink = data['serviceLink']??"";
    privacyLink = data['privacyLink']??"";
    promotionLink = data['promotionLink']??"";
    adLink = data['adLink']??"";
    businessNumber = data['businessNumber']??"";
    if (data['bodyFormCode'] != null && data['bodyFormCode'] is List) {bodyFormCode = (data['bodyFormCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {bodyFormCode = [];}
    if (data['drinkCode'] != null && data['drinkCode'] is List) {drinkCode = (data['drinkCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {drinkCode = [];}
    if (data['religionCode'] != null && data['religionCode'] is List) {religionCode = (data['religionCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {religionCode = [];}
    if (data['personalityCode'] != null && data['personalityCode'] is List) {personalityCode = (data['personalityCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {personalityCode = [];}
    if (data['interestCode'] != null && data['interestCode'] is List) {interestCode = (data['interestCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {interestCode = [];}
    if (data['attractionCode'] != null && data['attractionCode'] is List) {attractionCode = (data['attractionCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {attractionCode = [];}
    if (data['dateStyleCode'] != null && data['dateStyleCode'] is List) {dateStyleCode = (data['dateStyleCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {dateStyleCode = [];}
    if (data['areaCode'] != null && data['areaCode'] is List) {areaCode = (data['areaCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {areaCode = [];}
    if (data['pointCode'] != null && data['pointCode'] is List) {pointCode = (data['pointCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {pointCode = [];}
    if (data['adminAccessCode'] != null && data['adminAccessCode'] is List) {adminAccessCode = (data['adminAccessCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {adminAccessCode = [];}
    if (data['loungeCategoryCode'] != null && data['loungeCategoryCode'] is List) {loungeCategoryCode = (data['loungeCategoryCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {loungeCategoryCode = [];}
    if (data['communityReportCode'] != null && data['communityReportCode'] is List) {communityReportCode = (data['communityReportCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {communityReportCode = [];}
    if (data['partyCategoryCode'] != null && data['partyCategoryCode'] is List) {partyCategoryCode = (data['partyCategoryCode'] as List).map((item) {return CodeVo.fromJson(item);}).toList();} else {partyCategoryCode = [];}

  }

 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['appName'] = this.appName??"";
    data['appVersion'] = this.appVersion?.toJson()??"";
    data['buildVersion'] = this.appVersion?.toJson()??"";
    data['serviceLink'] = this.serviceLink??"";
    data['privacyLink'] = this.privacyLink??"";
    data['promotionLink'] = this.promotionLink??"";
    data['adLink'] = this.adLink??"";
    data['businessNumber'] = this.businessNumber??"";
    data['bodyFormCode'] = this.bodyFormCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['drinkCode'] = this.drinkCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['religionCode'] = this.religionCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['personalityCode'] = this.personalityCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['interestCode'] = this.interestCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['attractionCode'] = this.attractionCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['dateStyleCode'] = this.dateStyleCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['areaCode'] = this.areaCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['pointCode'] = this.pointCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['adminAccessCode'] = this.adminAccessCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['loungeCategoryCode'] = this.loungeCategoryCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['communityReportCode'] = this.communityReportCode?.map((codeVo) {return codeVo.toJson();})?.toList();
    data['partyCategoryCode'] = this.partyCategoryCode?.map((codeVo) {return codeVo.toJson();})?.toList();

    return data;
  }

}

class CodeVo {

  String? code; // 코드
  String? description; // 설명
 
  CodeVo({
    this.code,
    this.description,
  });

  CodeVo.fromJson(Map<String , dynamic> data) {
    code = data['code']??"";
    description = data['description']??"";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['code'] = this.code??"";
    data['description'] = this.description??"";
    
    return data;
  }

}

class AppVersionVo {

  String? android; // 안드로이드
  String? ios; // 아이오에스

  AppVersionVo({
    this.android,
    this.ios,
  });

  AppVersionVo.fromJson(Map<String , dynamic> data) {
    android = data['android']??"";
    ios = data['ios']??"";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['android'] = this.android??"";
    data['ios'] = this.ios??"";

    return data;
  }

}
class BuildVersionVo {

  num? android; // 안드로이드
  num? ios; // 아이오에스

  BuildVersionVo({
    this.android,
    this.ios,
  });

  BuildVersionVo.fromJson(Map<String , dynamic> data) {
    android = data['android']??"";
    ios = data['ios']??"";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['android'] = this.android??"";
    data['ios'] = this.ios??"";

    return data;
  }

}