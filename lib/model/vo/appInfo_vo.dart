import 'package:cloud_firestore/cloud_firestore.dart';

import '../../global/global.dart';

class AppInfoVo {

  String? appName; // 앱이름
  Map<String,dynamic>?	appVersion; // 버전
  Map<String,dynamic>?	buildVersion; // 빌드버전
  String? serviceLink; // 서비스이용약관링크
  String? privacyLink; // 개인정보 보호정책 링크
  String? promotionLink; // 홍보 및 마케팅 링크
  String? adLink; // 광고성 정보 수신동의서 링크
  String? businessNumber; // 사업자번호
  Map<String,dynamic>?	bodyFormCode; // 체형코드
  Map<String,dynamic>?	drinkCode; // 음주코드
  Map<String,dynamic>?	religionCode; // 종교코드
  Map<String,dynamic>?	personalityCode; // 성격코드
  Map<String,dynamic>?	interestCode; // 관심코드
  Map<String,dynamic>?	attractionCode; // 매력코드
  Map<String,dynamic>?	dateStyleCode; // 데이트스타일코드
  Map<String,dynamic>?	areaCode; // 지역구코드
  Map<String,dynamic>?	pointCode; // 포인트코드
  Map<String,dynamic>?	adminAccessCode; // 관리자접근권한코드
  Map<String,dynamic>?	loungeCategoryCode; // 라운지카테고리코드
  Map<String,dynamic>?	communityReportCode; // 커뮤니티신고코드
  Map<String,dynamic>?	partyCategoryCode; // 파티카테고리코드
  
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
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>? ?? {};

    appName = data['appName']??"";
    appVersion = data['appVersion']??{};
    buildVersion = data['buildVersion']??{};
    serviceLink = data['serviceLink']??"";
    privacyLink = data['privacyLink']??"";
    promotionLink = data['promotionLink']??"";
    adLink = data['adLink']??"";
    businessNumber = data['businessNumber']??"";
    bodyFormCode = data['bodyFormCode']??{};
    drinkCode = data['drinkCode']??{};
    religionCode = data['religionCode']??{};
    personalityCode = data['personalityCode']??{};
    interestCode = data['interestCode']??{};
    attractionCode = data['attractionCode']??{};
    dateStyleCode = data['dateStyleCode']??{};
    areaCode = data['areaCode']??{};
    pointCode = data['pointCode']??{};
    adminAccessCode = data['adminAccessCode']??{};
    loungeCategoryCode = data['loungeCategoryCode']??{};
    communityReportCode = data['communityReportCode']??{};
    partyCategoryCode = data['partyCategoryCode']??{};

  }

 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['appName'] = this.appName??"";
    data['appVersion'] = this.appVersion??{};
    data['buildVersion'] = this.appVersion??{};
    data['serviceLink'] = this.serviceLink??"";
    data['privacyLink'] = this.privacyLink??"";
    data['promotionLink'] = this.promotionLink??"";
    data['adLink'] = this.adLink??"";
    data['businessNumber'] = this.businessNumber??"";
    data['bodyFormCode'] = this.bodyFormCode??{};
    data['drinkCode'] = this.drinkCode??{};
    data['religionCode'] = this.religionCode??{};
    data['personalityCode'] = this.personalityCode??{};
    data['interestCode'] = this.interestCode??{};
    data['attractionCode'] = this.attractionCode??{};
    data['dateStyleCode'] = this.dateStyleCode??{};
    data['areaCode'] = this.areaCode??{};
    data['pointCode'] = this.pointCode??{};
    data['adminAccessCode'] = this.adminAccessCode??{};
    data['loungeCategoryCode'] = this.loungeCategoryCode??{};
    data['communityReportCode'] = this.communityReportCode??{};
    data['partyCategoryCode'] = this.partyCategoryCode??{};

    return data;
  }

}

