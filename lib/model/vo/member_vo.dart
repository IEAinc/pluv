import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../global/global.dart';

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
  MinMaxVo? idealAgeSection; //	이상형나이구간
  MinMaxVo? idealDistanceSection; //	이상형거리구간
  MinMaxVo? idealHeightSection; //	이상형키구간
  String?	idealBodyFormCode; //	이상형체형코드
  String?	idealDrinkCode; //	이상형음주코드
  bool?	idealSmoke; //	이상형흡연여부
  String?	idealReligionCode; //	이상형종교코드
  List<String>?	idealPersonalityCode; //	이상형성격코드
  List<String>?	idealInterestCode; //	이상형관심코드
  List<String>?	idealAttractionCode; //	이상형매력코드
  List<String>?	idealDateStyleCode; // 이상형데이트코드
  Map<String,String>? idealMbti; // 이상형 MBTI
  Map<String,bool>? idealSettingStatus; //	구간별이상형설정상태
  List<UseableProfileVo>? useableProfileList; //	볼수있는 프로필 리스트
  List<PaperInfoVo>? paperInfo; //	인증서류및뱃지
  Timestamp? joinDate; //	가입일
  num?	activeState; //	활동상태
  num?	memberDivision; //	회원구분
  Timestamp?	outDate; //	탈퇴한날짜
  bool?	promotionAgree; //	홍보 및 마케팅 동의여부
  bool?	adAgree; //	광고성 정보수신 동의여부
  bool?	test; //	테스트 여부
  List<AlarmCodeVo>? alarmStatus; //	알람온오프여부


  //***멤버 변수로만 존재
  String? memberPassword; //	회원가입용 비밀번호

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
    memberBirth = data['memberBirth']??Timestamp.now();
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
    mbti = data['mbti']??{};
    profileImageList = data['profileImageList']??[];
    selfIntroduce = data['selfIntroduce']??"";
    phoneBlockList = data['phoneBlockList']??[];
    idealAgeSection = MinMaxVo.fromJson(data['idealAgeSection']);
    idealDistanceSection = MinMaxVo.fromJson(data['idealDistanceSection']);
    idealHeightSection = MinMaxVo.fromJson(data['idealHeightSection']);
    idealBodyFormCode = data['idealBodyFormCode']??"";
    idealDrinkCode = data['idealDrinkCode']??"";
    idealSmoke = data['idealSmoke']??false;
    idealReligionCode = data['idealReligionCode']??"";
    idealPersonalityCode = data['idealPersonalityCode']??[];
    idealInterestCode = data['idealInterestCode']??[];
    idealAttractionCode = data['idealAttractionCode']??[];
    idealDateStyleCode = data['idealDateStyleCode']??[];
    idealMbti = data['idealMbti']??{};
    idealSettingStatus = data['idealSettingStatus']??{};
    if (data['useableProfileList'] != null && data['useableProfileList'] is List) {
      useableProfileList = (data['useableProfileList'] as List).map((item) {
        return UseableProfileVo.fromJson(item);}).toList();
    } else {
      useableProfileList = [];
    }
    if (data['paperInfo'] != null && data['paperInfo'] is List) {
      paperInfo = (data['paperInfo'] as List).map((item) {
        return PaperInfoVo.fromJson(item);}).toList();
    } else {
      paperInfo = [];
    }

    joinDate = data['joinDate']??Timestamp.now();
    activeState = data['activeState']??1;
    memberDivision = data['memberDivision']??1;
    outDate = data['outDate']??null;
    promotionAgree = data['promotionAgree']??false;
    adAgree = data['adAgree']??false;
    test = data['test']??false;
    if (data['alarmStatus'] != null && data['alarmStatus'] is List) {
      alarmStatus = (data['alarmStatus'] as List).map((item) {
        return AlarmCodeVo.fromJson(item);}).toList();
    } else {
      alarmStatus = [];
    }



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['memberUid'] = this.memberUid??"";
    data['memberEmail'] = this.memberEmail??"";
    data['memberName'] = this.memberName??"";
    data['memberBirth'] = this.memberBirth??Timestamp.now();
    data['memberGender'] = this.memberGender??true;
    data['memberPhone'] = this.memberPhone??"";
    data['yourInviteCode'] = this.yourInviteCode??"";
    data['myInviteCode'] = this.myInviteCode??"";
    data['fcmToken'] = this.fcmToken??"";
    data['memberStatus'] = this.memberStatus??1;
    data['screeningDivision'] = this.screeningDivision??1;
    data['profileStatus'] = this.profileStatus??0;
    data['nickName'] = this.nickName??"";
    data['areaCode'] = this.areaCode??"";
    data['areaDetailCode'] = this.areaDetailCode??"";
    data['memberHeight'] = this.memberHeight??0;
    data['memberJob'] = this.memberJob??"";
    data['bodyFormCode'] = this.bodyFormCode??"";
    data['drinkCode'] = this.drinkCode??"";
    data['smoke'] = this.smoke??false;
    data['religionCode'] = this.religionCode??"";
    data['personalityCode'] = this.personalityCode??"";
    data['interestCode'] = this.interestCode??"";
    data['attractionCode'] = this.attractionCode??"";
    data['dateStyleCode'] = this.dateStyleCode??"";
    data['mbti'] = this.mbti??{};
    data['profileImageList'] = this.profileImageList??[];
    data['selfIntroduce'] = this.selfIntroduce??"";
    data['phoneBlockList'] = this.phoneBlockList??[];
    data['idealAgeSection'] = this.idealAgeSection?.toJson()??null;
    data['idealDistanceSection'] = this.idealDistanceSection?.toJson()??null;
    data['idealHeightSection'] = this.idealHeightSection?.toJson()??null;
    data['idealBodyFormCode'] = this.idealBodyFormCode??"";
    data['idealDrinkCode'] = this.idealDrinkCode??"";
    data['idealSmoke'] = this.idealSmoke??false;
    data['idealReligionCode'] = this.idealReligionCode??"";
    data['idealPersonalityCode'] = this.idealPersonalityCode??[];
    data['idealInterestCode'] = this.idealInterestCode??[];
    data['idealAttractionCode'] = this.idealAttractionCode??[];
    data['idealDateStyleCode'] = this.idealDateStyleCode??[];
    data['idealMbti'] = this.idealMbti??{};
    data['idealSettingStatus'] = this.idealSettingStatus??{};
    data['useableProfileList'] = this.useableProfileList?.map((item) {return item.toJson();})?.toList()??[];
    data['paperInfo'] = this.paperInfo?.map((item) {return item.toJson();})?.toList()??[];
    data['joinDate'] = this.joinDate??Timestamp.now();
    data['activeState'] = this.activeState??1;
    data['memberDivision'] = this.memberDivision??1;
    data['outDate'] = this.outDate??null;
    data['promotionAgree'] = this.promotionAgree??false;
    data['adAgree'] = this.adAgree??false;
    data['test'] = this.test??false;
    data['alarmStatus'] = this.alarmStatus?.map((item) {return item.toJson();})?.toList()??[];

    return data;
  }

  MemberVo.sample() {

    memberUid = "";
    memberEmail = "ieatest${generateRandomString(7)}@iea.co.kr";
    memberName = generateRandomKoreanNickname(3);
    memberBirth = Timestamp.now();
    memberGender = true;
    memberPhone = "010-9999-9999";
    yourInviteCode = "";
    myInviteCode = "";
    fcmToken = "";
    memberStatus = 3;
    screeningDivision = 2;
    profileStatus = 3;
    nickName = "테스터";
    areaCode = "";
    areaDetailCode = "";
    memberHeight = 180;
    memberJob = "테스터";
    bodyFormCode = "";
    drinkCode = "";
    smoke = true;
    religionCode = "";
    personalityCode = "";
    interestCode = [];
    attractionCode = [];
    dateStyleCode = [];
    mbti = {"a":"i","b":"n","c":"f","d":"p",};
    profileImageList = [];
    selfIntroduce = "안녕하세요 테스터입니다";
    phoneBlockList = [];
    idealAgeSection = MinMaxVo(min: 20,max: 30);
    idealDistanceSection = MinMaxVo(min: 0,max: 50);
    idealHeightSection = MinMaxVo(min: 150,max: 170);
    idealBodyFormCode = "";
    idealDrinkCode = "";
    idealSmoke = true;
    idealReligionCode = "";
    idealPersonalityCode = [];
    idealInterestCode = [];
    idealAttractionCode = [];
    idealDateStyleCode = [];
    idealMbti = {"a":"i","b":"n","c":"f","d":"p",};
    idealSettingStatus = {"step1" : false ,"step2" : false , "step3" : false };
    useableProfileList = [];
    paperInfo = [];
    joinDate = Timestamp.now();
    activeState = 1;
    memberDivision = 3;
    outDate = null;
    promotionAgree = false;
    adAgree = false;
    test = true;
    alarmStatus = [];
  }



}

//보조 클래스

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
    data['profileOpenDate'] = this.profileOpenDate??null;

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
    if (data['paperDetail'] != null && data['paperDetail'] is List) {
      paperDetail = (data['paperInfo'] as List).map((item) {
        return PaperDetailVo.fromJson(item);}).toList();
    } else {
      paperDetail = [];
    }
    certificateDate = data['certificateDate']??null;
    certificateAdminUid = data['certificateAdminUid']??"";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['paperCode'] = this.paperCode??"";
    data['certificate'] = this.certificate??false;
    data['paperDetail'] = this.paperDetail?.map((detail) {return detail.toJson();})?.toList();
    data['certificateDate'] = this.certificateDate??null;
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
class AlarmCodeVo {

  String?	alarmCode; // 알람코드
  bool?	onOff; //온오프

  AlarmCodeVo({
    this.alarmCode,
    this.onOff,

  });

  AlarmCodeVo.fromJson(Map<String , dynamic> data) {
    alarmCode = data['alarmCode']??"";
    onOff = data['onOff']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['alarmCode'] = this.alarmCode??"";
    data['onOff'] = this.onOff??false;

    return data;
  }

}
class MinMaxVo {

  num? min; // 최소값
  num? max; // 최대값

  MinMaxVo({
    this.min,
    this.max,

  });

  MinMaxVo.fromJson(Map<String , dynamic> data) {
    min = data['min']??0;
    max = data['max']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['min'] = this.min??0;
    data['max'] = this.max??0;

    return data;
  }

}