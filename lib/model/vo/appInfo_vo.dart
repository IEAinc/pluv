
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../global/global.dart';

class AppInfoVo {

  String? appName; // 앱이름
  Map<String,dynamic>?	appVersion; // 버전
  Map<String,dynamic>?	buildVersion; // 빌드버전
  List<MediaInfoVo>?	onboardingInfoList; // 온보딩인포
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
  Map<String,dynamic>?	reportCode; // 신고코드
  Map<String,dynamic>?	alarmCode; // 알람코드
  List<NoticeVo>?	noticeList; // 공지 및 faq



  List<MapEntry<String, dynamic>>?	bodyFormCodeEntryList; // 체형코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	drinkCodeEntryList; // 음주코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	religionCodeEntryList; // 종교코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	personalityCodeEntryList; // 성격코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	interestCodeEntryList; // 관심코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	attractionCodeEntryList; // 매력코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	dateStyleCodeEntryList; // 데이트스타일코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	areaCodeEntryList; // 지역구코드 엔트리 리스트

  List<MapEntry<String, dynamic>>?	pointCodeEntryList; // 포인트코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	adminAccessCodeEntryList; // 관리자접근권한코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	loungeCategoryCodeEntryList; // 라운지카테고리코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	communityReportCodeEntryList; // 커뮤니티신고코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	partyCategoryCodeEntryList; // 파티카테고리코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	reportCodeEntryList; // 신고코드 엔트리 리스트
  List<MapEntry<String, dynamic>>?	alarmCodeEntryList; // 알람코드 엔트리 리스트




  
  AppInfoVo({
    this.appName,
    this.appVersion,
    this.buildVersion,
    this.onboardingInfoList,
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
    this.reportCode,
    this.alarmCode,
    this.noticeList,
  }); 

  AppInfoVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>? ?? {};

    appName = data['appName']??"";
    appVersion = data['appVersion']??{};
    buildVersion = data['buildVersion']??{};
    if (data['onboardingInfoList'] != null && data['onboardingInfoList'] is List) {
      onboardingInfoList = (data['onboardingInfoList'] as List).map((item) {
        return MediaInfoVo.fromJson(item);}).toList();
    } else {
      onboardingInfoList = [];
    }
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
    reportCode = data['reportCode']??{};
    alarmCode = data['alarmCode']??{};

    if (data['noticeList'] != null && data['noticeList'] is List) {
      noticeList = (data['noticeList'] as List).map((item) {
        return NoticeVo.fromJson(item);}).toList();
    } else {
      noticeList = [];
    }

  }

 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['appName'] = this.appName??"";
    data['appVersion'] = this.appVersion??{};
    data['buildVersion'] = this.appVersion??{};
    data['onboardingInfoList'] = onboardingInfoList?.map((item) {return item.toJson();})?.toList()??[];
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
    data['reportCode'] = this.reportCode??{};
    data['alarmCode'] = this.alarmCode??{};

    data['noticeList'] = noticeList?.map((item) {return item.toJson();})?.toList()??[];
    return data;
  }

  void makeEntry(){
    bodyFormCodeEntryList = getEntry(bodyFormCode);
    drinkCodeEntryList = getEntry(drinkCode);
    religionCodeEntryList = getEntry(religionCode);
    personalityCodeEntryList = getEntry(personalityCode);
    interestCodeEntryList = getEntry(interestCode);
    attractionCodeEntryList = getEntry(attractionCode);
    dateStyleCodeEntryList = getEntry(dateStyleCode);
    areaCodeEntryList = getEntry(areaCode);
    pointCodeEntryList = getEntry(pointCode);
    adminAccessCodeEntryList = getEntry(adminAccessCode);
    loungeCategoryCodeEntryList = getEntry(loungeCategoryCode);
    communityReportCodeEntryList = getEntry(communityReportCode);
    partyCategoryCodeEntryList = getEntry(partyCategoryCode);
    reportCodeEntryList = getEntry(reportCode);
    alarmCodeEntryList = getEntry(alarmCode);

  }
  List<MapEntry<String, dynamic>> getEntry(Map<String,dynamic>? map) {
    if(map !=null){
      List<MapEntry<String, dynamic>> entries = map!.entries.toList();
      entries.sort((a, b) {
        int numA = int.parse(a.key.split('_').last);
        int numB = int.parse(b.key.split('_').last);
        return numA.compareTo(numB);
      });
      return entries;
    }else{
      return [];
    }
  }



}

class NoticeVo {

  String?	title;	//제목
  String?	type;	//타입
  String?	contents;	//내용
  bool?	exposure;	//노출여부
  List<dynamic>?	image;	//참고이미지링크
  String?	editAdminUid;	//최종수정자
  Timestamp?	createDate;	//최초등록일자
  Timestamp?	updateDate;	//마지막수정일자


  NoticeVo({
    this.title,
    this.type,
    this.contents,
    this.exposure,
    this.image,
    this.editAdminUid,
    this.createDate,
    this.updateDate,
  });

  NoticeVo.fromJson(Map<String , dynamic> data) {
    title = data['title']??"";
    type = data['type']??"notice";
    contents = data['contents']??"";
    exposure = data['exposure']??false;
    image = data['image']??[];
    editAdminUid = data['editAdminUid']??"";
    createDate = data['createDate']??Timestamp.now();
    updateDate = data['updateDate']??Timestamp.now();
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = title??"";
    data['type'] = type??"";
    data['contents'] = contents??"";
    data['exposure'] = exposure??false;
    data['image'] = image??[];
    data['editAdminUid'] = editAdminUid??"";
    data['createDate'] = createDate??Timestamp.now();
    data['updateDate'] = updateDate??Timestamp.now();
    return data;
  }

}

class MediaInfoVo {

  String?	title;	//제목
  String?	subTitle;	//서브제목
  String?	contents;	//내용
  num?	mediaType;	//미디어타입
  String?	url;	// 경로



  MediaInfoVo({
    this.title,
    this.subTitle,
    this.contents,
    this.mediaType,
    this.url,
  });

  MediaInfoVo.fromJson(Map<String , dynamic> data) {
    title = data['title']??"";
    subTitle = data['subTitle']??"";
    contents = data['contents']??"";
    mediaType = data['mediaType']??1;
    url = data['url']??"";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = title??"";
    data['subTitle'] = subTitle??"";
    data['contents'] = contents??"";
    data['mediaType'] = mediaType??1;
    data['url'] = url??"";
    return data;
  }

}