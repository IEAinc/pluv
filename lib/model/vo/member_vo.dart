import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../global/global.dart';

class MemberVo {

  String? memberUid; //	유저고유UID
  String? memberEmail; //	이메일
  String? memberName; //	이름
  String? memberBirth; //	생년월일
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
  List<dynamic>?	interestCode; //	관심코드
  List<dynamic>?	attractionCode; //	매력코드
  List<dynamic>?	dateStyleCode; // 데이트 스타일코드
  Map<String,dynamic>? mbti; //	MBTI
  List<dynamic>?	profileImageList; // 프로필사진
  String?	selfIntroduce;	// 자기소개
  List<dynamic>?	phoneBlockList; // 휴대폰차단리스트
  Map<String,dynamic>? idealAgeSection; //	이상형나이구간
  Map<String,dynamic>? idealDistanceSection; //	이상형거리구간
  Map<String,dynamic>? idealHeightSection; //	이상형키구간
  String?	idealBodyFormCode; //	이상형체형코드
  String?	idealDrinkCode; //	이상형음주코드
  bool?	idealSmoke; //	이상형흡연여부
  String?	idealReligionCode; //	이상형종교코드
  List<dynamic>?	idealPersonalityCode; //	이상형성격코드
  List<dynamic>?	idealInterestCode; //	이상형관심코드
  List<dynamic>?	idealAttractionCode; //	이상형매력코드
  List<dynamic>?	idealDateStyleCode; // 이상형데이트코드
  Map<String,dynamic>? idealMbti; // 이상형 MBTI
  Map<String,dynamic>? idealSettingStatus; //	구간별이상형설정상태
  List<UseableProfileVo>? useableProfileList; //	볼수있는 프로필 리스트
  List<PaperInfoVo>? paperInfo; //	인증서류및뱃지
  Timestamp? joinDate; //	가입일
  num?	activeState; //	활동상태
  num?	memberDivision; //	회원구분
  Timestamp?	outDate; //	탈퇴한날짜
  bool?	promotionAgree; //	홍보 및 마케팅 동의여부
  bool?	adAgree; //	광고성 정보수신 동의여부
  bool?	test; //	테스트 여부
  Map<String,dynamic>? alarmStatus; //	알람온오프여부


  //***멤버 변수로만 존재
  String? memberPassword; //	회원가입용 비밀번호

  MemberVo({
    this.memberUid,
    required this.memberEmail,
    required this.memberName,
    required this.memberBirth,
    required this.memberGender,
    required this.memberPhone,
    this.yourInviteCode,
    this.myInviteCode,
    required this.fcmToken,
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

    logger.e(data);
    memberUid = data['memberUid'];
    memberEmail = data['memberEmail'];
    memberName = data['memberName'];
    memberBirth = data['memberBirth'];
    memberGender = data['memberGender'];
    memberPhone = data['memberPhone'];
    yourInviteCode = data['yourInviteCode'];
    myInviteCode = data['myInviteCode'];
    fcmToken = data['fcmToken'];
    memberStatus = data['memberStatus']??1;
    screeningDivision = data['screeningDivision']??1;
    profileStatus = data['profileStatus']??0;
    nickName = data['nickName'];
    areaCode = data['areaCode'];
    areaDetailCode = data['areaDetailCode'];
    memberHeight = data['memberHeight'];
    memberJob = data['memberJob'];
    bodyFormCode = data['bodyFormCode'];
    drinkCode = data['drinkCode'];
    smoke = data['smoke'];
    religionCode = data['religionCode'];
    personalityCode = data['personalityCode'];
    interestCode = data['interestCode']??[];
    attractionCode = data['attractionCode']??[];
    dateStyleCode = data['dateStyleCode']??[];
    mbti = data['mbti']??{};
    profileImageList = data['profileImageList']??[];
    selfIntroduce = data['selfIntroduce'];
    phoneBlockList = data['phoneBlockList']??[];
    idealAgeSection = data['idealAgeSection'];
    idealDistanceSection = data['idealDistanceSection'];
    idealHeightSection = data['idealHeightSection'];
    idealBodyFormCode = data['idealBodyFormCode'];
    idealDrinkCode = data['idealDrinkCode'];
    idealSmoke = data['idealSmoke']??false;
    idealReligionCode = data['idealReligionCode'];
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
    outDate = data['outDate'];
    promotionAgree = data['promotionAgree']??false;
    adAgree = data['adAgree']??false;
    test = data['test']??false;
    alarmStatus = data['alarmStatus'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['memberUid'] = memberUid;
    data['memberEmail'] = memberEmail;
    data['memberName'] = memberName;
    data['memberBirth'] = memberBirth;
    data['memberGender'] = memberGender;
    data['memberPhone'] = memberPhone;
    data['yourInviteCode'] = yourInviteCode??"";
    data['myInviteCode'] = myInviteCode??"";
    data['fcmToken'] = fcmToken;
    data['memberStatus'] = memberStatus??1;
    data['screeningDivision'] = screeningDivision??1;
    data['profileStatus'] = profileStatus??0;
    data['nickName'] = nickName??"";
    data['areaCode'] = areaCode??"";
    data['areaDetailCode'] = areaDetailCode??"";
    data['memberHeight'] = memberHeight??0;
    data['memberJob'] = memberJob??"";
    data['bodyFormCode'] = bodyFormCode??"";
    data['drinkCode'] = drinkCode??"";
    data['smoke'] = smoke??false;
    data['religionCode'] = religionCode??"";
    data['personalityCode'] = personalityCode??"";
    data['interestCode'] = interestCode??[];
    data['attractionCode'] = attractionCode??[];
    data['dateStyleCode'] = dateStyleCode??[];
    data['mbti'] = mbti??{};
    data['profileImageList'] = profileImageList??[];
    data['selfIntroduce'] = selfIntroduce??"";
    data['phoneBlockList'] = phoneBlockList??[];
    data['idealAgeSection'] = idealAgeSection??{};
    data['idealDistanceSection'] = idealDistanceSection??{};
    data['idealHeightSection'] = idealHeightSection??{};
    data['idealBodyFormCode'] = idealBodyFormCode??"";
    data['idealDrinkCode'] = idealDrinkCode??"";
    data['idealSmoke'] = idealSmoke??false;
    data['idealReligionCode'] = idealReligionCode??"";
    data['idealPersonalityCode'] = idealPersonalityCode??[];
    data['idealInterestCode'] = idealInterestCode??[];
    data['idealAttractionCode'] = idealAttractionCode??[];
    data['idealDateStyleCode'] = idealDateStyleCode??[];
    data['idealMbti'] = idealMbti??{};
    data['idealSettingStatus'] = idealSettingStatus??{};
    data['useableProfileList'] = useableProfileList?.map((item) {return item.toJson();})?.toList()??[];
    data['paperInfo'] = paperInfo?.map((item) {return item.toJson();})?.toList()??[];
    data['joinDate'] = joinDate??Timestamp.now();
    data['activeState'] = activeState??1;
    data['memberDivision'] = memberDivision??1;
    data['outDate'] = outDate;
    data['promotionAgree'] = promotionAgree??false;
    data['adAgree'] = adAgree??false;
    data['test'] = test??false;
    data['alarmStatus'] = alarmStatus;

    return data;
  }

  MemberVo.sample() {

    memberUid = "";
    memberEmail = "ieatest${generateRandomString(7)}@iea.co.kr";
    memberName = generateRandomKoreanNickname(3);
    memberBirth = "900317";
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
    idealAgeSection = {};
    idealDistanceSection = {};
    idealHeightSection = {};
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
    alarmStatus = {};
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
