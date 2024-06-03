import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class MemberVo {

  String? memberUid; //	유저고유UID
  String? memberEmail; //	이메일
  String? memberName; //	이름
  Timestamp? memberBirth; //	생년월일
  bool? memberGender; //	성별
  String? memberPhone; //	휴대폰번호
  String? yourInviteCode; //	내가등록한초대코드
  String? myInviteCode; //	나의초대코드
  String? fcmToken; //	FCM토큰
  num? memberStatus; //	회원상태
  num? screeningDivision; //	심사구분
  num? profileStatus; //	프로필입력상태
  String? nickName; //	닉네임
  String? areaCode; //	지역구코드
  String? areaDetailCode; //	지역구상세코드
  num? memberHeight; //	키
  String? memberJob; //	기본직업
  String? bodyFormCode; //	체형코드
  String? drinkCode; //	음주코드
  bool? smoke; //	흡연
  String? religionCode; //	종교코드
  String? personalityCode; //	성격코드
  List<String>?	interestCode; //	관심코드
  List<String>?	attractionCode; //	매력코드
  List<String>?	dateStyleCode; // 데이트 스타일코드
  Map<String,String>? mbti; //	MBTI
  List<String>?	profileImageList; // 프로필사진
  String?	selfIntroduce;	// 자기소개
  List<String>?	phoneBlockList; // 휴대폰차단리스트
  Map<String,num>? idealAgeSection; //	이상형나이구간
  Map<String,num>? idealDistanceSection; //	이상형거리구간
  Map<String,num>? idealHeightSection; //	이상형키구간
  String?	idealBodyFormCode; //	이상형체형코드
  String?	idealDrinkCode; //	이상형음주코드
  bool?	idealSmoke; //	이상형흡연여부
  String?	idealReligionCode; //	이상형종교코드
  List<String>?	idealPersonalityCode; //	이상형성격코드
  List<String>?	idealInterestCode; //	이상형관심코드
  List<String>?	idealAttractionCode; //	이상형매력코드
  List<String>?	idealDateStyleCode; // 이상형데이트코드
  Map<String,String>? idealMbti; // 이상형 MBTI
  Map<String,num>? idealSettingStatus; //	구간별이상형설정상태
  List<UseableProfileVo>? useableProfileList; //	볼수있는 프로필 리스트
  List<Map>? paperInfo; //	인증서류및뱃지
  Timestamp? joinDate; //	가입일
  bool?	activeState; //	활동상태
  num?	memberDivision; //	회원구분
  Timestamp?	outDate; //	탈퇴한날짜
  bool?	promotionAgree; //	홍보 및 마케팅 동의여부
  bool?	adAgree; //	광고성 정보수신 동의여부
  bool?	test; //	테스트 여부
  List<Map>? alarmStatus; //	알람온오프여부

  MemberVo({
    this.memberUid,
    this.memberEmail,
    this.memberName,
    this.memberBirth,
    this.memberGender,
    this.memberPhone,
    this.yourInviteCode,
    this.myInviteCode,
    this.fcmToken,
    this.memberStatus,
    this.screeningDivision,
    this.profileStatus,
    this.nickName,
    this.areaCode,
    this.areaDetailCode,
    this.memberHeight,
    this.memberJob,
    this.bodyFormCode,
    this.drinkCode,
    this.smoke,
    this.religionCode,
    this.personalityCode,
    this.interestCode,
    this.attractionCode,
    this.dateStyleCode,
    this.mbti,
    this.profileImageList,
    this.selfIntroduce,
    this.phoneBlockList,
    this.idealAgeSection,
    this.idealDistanceSection,
    this.idealHeightSection,
    this.idealBodyFormCode,
    this.idealDrinkCode,
    this.idealSmoke,
    this.idealReligionCode,
    this.idealPersonalityCode,
    this.idealInterestCode,
    this.idealAttractionCode,
    this.idealDateStyleCode,
    this.idealMbti,
    this.idealSettingStatus,
    this.useableProfileList,
    this.paperInfo,
    this.joinDate,
    this.activeState,
    this.memberDivision,
    this.outDate,
    this.promotionAgree,
    this.adAgree,
    this.test,
    this.alarmStatus,


  });

  MemberVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    memberUid = data['memberUid']??"";
    memberEmail = data['memberEmail']??"";
    memberName = data['memberName']??"";
    memberBirth = data['memberBirth']??null;
    memberGender = data['memberGender']??true;
    memberPhone = data['memberPhone']??"";
    yourInviteCode = data['yourInviteCode']??"";
    myInviteCode = data['myInviteCode']??"";
    fcmToken = data['fcmToken']??"";
    memberStatus = data['memberStatus']??1;
    screeningDivision = data['screeningDivision']??1;
    profileStatus = data['profileStatus']??0;
    nickName = data['nickName']??"";
    areaCode = data['areaCode']??"";
    areaDetailCode = data['areaDetailCode']??"";
    memberHeight = data['memberHeight']??0;
    memberJob = data['memberJob']??"";
    bodyFormCode = data['bodyFormCode']??"";
    drinkCode = data['drinkCode']??"";
    smoke = data['smoke']??false;
    religionCode = data['religionCode']??"";
    personalityCode = data['personalityCode']??"";
    interestCode = data['interestCode']??[];
    attractionCode = data['attractionCode']??[];
    dateStyleCode = data['dateStyleCode']??[];
    mbti = data['mbti']??"";
    profileImageList = data['profileImageList']??[];
    selfIntroduce = data['selfIntroduce']??"";
    phoneBlockList = data['phoneBlockList']??[];
    idealAgeSection = data['idealAgeSection']??"";
    idealDistanceSection = data['idealDistanceSection']??"";
    idealHeightSection = data['idealHeightSection']??"";
    idealBodyFormCode = data['idealBodyFormCode']??"";
    idealDrinkCode = data['idealDrinkCode']??"";
    idealSmoke = data['idealSmoke']??"";
    idealReligionCode = data['idealReligionCode']??"";
    idealPersonalityCode = data['idealPersonalityCode']??[];
    idealInterestCode = data['idealInterestCode']??[];
    idealAttractionCode = data['idealAttractionCode']??[];
    idealDateStyleCode = data['idealDateStyleCode']??[];
    idealMbti = data['idealMbti']??"";
    idealSettingStatus = data['idealSettingStatus']??"";
    useableProfileList = data['useableProfileList']??"";
    paperInfo = data['paperInfo']??"";
    joinDate = data['joinDate']??"";
    activeState = data['activeState']??"";
    memberDivision = data['memberDivision']??"";
    outDate = data['outDate']??"";
    promotionAgree = data['promotionAgree']??"";
    adAgree = data['adAgree']??"";
    test = data['test']??"";
    alarmStatus = data['alarmStatus']??"";


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['memberUid'] = this.memberUid??"";
    data['memberEmail'] = this.memberEmail??"";
    data['memberName'] = this.memberName??"";
    data['memberBirth'] = this.memberBirth??"";
    data['memberGender'] = this.memberGender??"";
    data['memberPhone'] = this.memberPhone??"";
    data['yourInviteCode'] = this.yourInviteCode??"";
    data['myInviteCode'] = this.myInviteCode??"";
    data['fcmToken'] = this.fcmToken??"";
    data['memberStatus'] = this.memberStatus??"";
    data['screeningDivision'] = this.screeningDivision??"";
    data['profileStatus'] = this.profileStatus??"";
    data['nickName'] = this.nickName??"";
    data['areaCode'] = this.areaCode??"";
    data['areaDetailCode'] = this.areaDetailCode??"";
    data['memberHeight'] = this.memberHeight??"";
    data['memberJob'] = this.memberJob??"";
    data['bodyFormCode'] = this.bodyFormCode??"";
    data['drinkCode'] = this.drinkCode??"";
    data['smoke'] = this.smoke??"";
    data['religionCode'] = this.religionCode??"";
    data['personalityCode'] = this.personalityCode??"";
    data['interestCode'] = this.interestCode??"";
    data['attractionCode'] = this.attractionCode??"";
    data['dateStyleCode'] = this.dateStyleCode??"";
    data['mbti'] = this.mbti??"";
    data['profileImageList'] = this.profileImageList??"";
    data['selfIntroduce'] = this.selfIntroduce??"";
    data['phoneBlockList'] = this.phoneBlockList??"";
    data['idealAgeSection'] = this.idealAgeSection??"";
    data['idealDistanceSection'] = this.idealDistanceSection??"";
    data['idealHeightSection'] = this.idealHeightSection??"";
    data['idealBodyFormCode'] = this.idealBodyFormCode??"";
    data['idealDrinkCode'] = this.idealDrinkCode??"";
    data['idealSmoke'] = this.idealSmoke??"";
    data['idealReligionCode'] = this.idealReligionCode??"";
    data['idealPersonalityCode'] = this.idealPersonalityCode??"";
    data['idealInterestCode'] = this.idealInterestCode??"";
    data['idealAttractionCode'] = this.idealAttractionCode??"";
    data['idealDateStyleCode'] = this.idealDateStyleCode??"";
    data['idealMbti'] = this.idealMbti??"";
    data['idealSettingStatus'] = this.idealSettingStatus??"";
    data['useableProfileList'] = this.useableProfileList??"";
    data['paperInfo'] = this.paperInfo??"";
    data['joinDate'] = this.joinDate??"";
    data['activeState'] = this.activeState??"";
    data['memberDivision'] = this.memberDivision??"";
    data['outDate'] = this.outDate??"";
    data['promotionAgree'] = this.promotionAgree??"";



    return data;
  }




}

class UseableProfileVo {

  String?	memberUid; // 프로필멤버Uid
  bool?	useable; // 프로필오픈가능여부
  String?	profileOpenCode; // 프로필오픈어떻게코드
  Timestamp?	profileOpenDate; // 프로필오픈날짜

  UseableProfileVo({
    this.memberUid,
    this.useable,
    this.profileOpenCode,
    this.profileOpenDate,
  });

  UseableProfileVo.fromJson(Map<String , dynamic> data) {
    memberUid = data['memberUid']??"";
    useable = data['useable']??false;
    profileOpenCode = data['profileOpenCode']??"";
    profileOpenDate = data['profileOpenDate']??null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['memberUid'] = this.memberUid??"";
    data['useable'] = this.useable??false;
    data['profileOpenCode'] = this.profileOpenCode??"";
    data['profileOpenDate'] = this.profileOpenDate??"";

    return data;
  }

}



class PaperInfoVo {

  String?	paperCode; // 인증서류종류코드
  bool?	certificate; // 인증완료여부
  List<PaperDetailVo>?	paperDetail; // 인증서류세부종류
  Timestamp?	certificateDate; // 인증완료날짜
  String?	certificateAdminUid; // 인증한관리자Uid


  PaperInfoVo({
    this.paperCode,
    this.certificate,
    this.paperDetail,
    this.certificateDate,
    this.certificateAdminUid,
  });

  PaperInfoVo.fromJson(Map<String , dynamic> data) {
    paperCode = data['paperCode']??"";
    certificate = data['certificate']??false;
    paperDetail = data['paperDetail']??"";
    certificateDate = data['certificateDate']??null;
    certificateAdminUid = data['certificateAdminUid']??null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['paperCode'] = this.paperCode??"";
    data['certificate'] = this.certificate??false;
    data['paperDetail'] = this.paperDetail??"";
    data['certificateDate'] = this.certificateDate??"";
    data['certificateAdminUid'] = this.certificateAdminUid??"";

    return data;
  }

}

class PaperDetailVo {

  String?	code; // 인증서류세부종류코드
  List<String>?	image; //인증서류이미지

  PaperDetailVo({
    this.code,
    this.image,

  });

  PaperDetailVo.fromJson(Map<String , dynamic> data) {
    code = data['code']??"";
    image = data['image']??[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['code'] = this.code??"";
    data['image'] = this.image??[];

    return data;
  }

}
