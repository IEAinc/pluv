
import 'package:cloud_firestore/cloud_firestore.dart';


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
  List<CodeInfoVo>?	bodyFormCode; // 체형코드
  List<CodeInfoVo>?	drinkCode; // 음주코드
  List<CodeInfoVo>?	religionCode; // 종교코드
  List<CodeInfoVo>?	personalityCode; // 성격코드
  List<CodeInfoVo>?	interestCode; // 관심코드
  List<CodeInfoVo>?	attractionCode; // 매력코드
  List<CodeInfoVo>?	dateStyleCode; // 데이트스타일코드
  List<CodeInfoVo>?	areaCode; // 지역구코드
  List<CodeInfoVo>?	pointCode; // 포인트코드
  List<CodeInfoVo>?	adminAccessCode; // 관리자접근권한코드
  List<CodeInfoVo>?	loungeCategoryCode; // 라운지카테고리코드
  List<CodeInfoVo>?	communityReportCode; // 커뮤니티신고코드
  List<CodeInfoVo>?	partyCategoryCode; // 파티카테고리코드
  List<CodeInfoVo>?	reportCode; // 신고코드
  List<CodeInfoVo>?	alarmCode; // 알람코드
  List<NoticeVo>?	noticeList; // 공지 및 faq


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


    if (data['bodyFormCode'] != null && data['bodyFormCode'] is List) {
      bodyFormCode = (data['bodyFormCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      bodyFormCode = [];
    }
    if (data['drinkCode'] != null && data['drinkCode'] is List) {
      drinkCode = (data['drinkCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      drinkCode = [];
    }
    if (data['religionCode'] != null && data['religionCode'] is List) {
      religionCode = (data['religionCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      religionCode = [];
    }
    if (data['personalityCode'] != null && data['personalityCode'] is List) {
      personalityCode = (data['personalityCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      personalityCode = [];
    }
    if (data['interestCode'] != null && data['interestCode'] is List) {
      interestCode = (data['interestCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      interestCode = [];
    }
    if (data['attractionCode'] != null && data['attractionCode'] is List) {
      attractionCode = (data['attractionCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      attractionCode = [];
    }
    if (data['dateStyleCode'] != null && data['dateStyleCode'] is List) {
      dateStyleCode = (data['dateStyleCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      dateStyleCode = [];
    }
    if (data['areaCode'] != null && data['areaCode'] is List) {
      areaCode = (data['areaCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      areaCode = [];
    }
    if (data['pointCode'] != null && data['pointCode'] is List) {
      pointCode = (data['pointCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      pointCode = [];
    }
    if (data['adminAccessCode'] != null && data['adminAccessCode'] is List) {
      adminAccessCode = (data['adminAccessCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      adminAccessCode = [];
    }

    if (data['loungeCategoryCode'] != null && data['loungeCategoryCode'] is List) {
      loungeCategoryCode = (data['loungeCategoryCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      loungeCategoryCode = [];
    }
    if (data['communityReportCode'] != null && data['communityReportCode'] is List) {
      communityReportCode = (data['communityReportCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      communityReportCode = [];
    }

    if (data['partyCategoryCode'] != null && data['partyCategoryCode'] is List) {
      partyCategoryCode = (data['partyCategoryCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      partyCategoryCode = [];
    }

    if (data['reportCode'] != null && data['reportCode'] is List) {
      reportCode = (data['reportCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      reportCode = [];
    }
    if (data['alarmCode'] != null && data['alarmCode'] is List) {
      alarmCode = (data['alarmCode'] as List).map((item) {
        return CodeInfoVo.fromJson(item);}).toList();
    } else {
      alarmCode = [];
    }
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
    data['bodyFormCode'] = bodyFormCode?.map((item) {return item.toJson();})?.toList()??[];
    data['drinkCode'] = drinkCode?.map((item) {return item.toJson();})?.toList()??[];
    data['religionCode'] = religionCode?.map((item) {return item.toJson();})?.toList()??[];
    data['personalityCode'] = personalityCode?.map((item) {return item.toJson();})?.toList()??[];
    data['interestCode'] = interestCode?.map((item) {return item.toJson();})?.toList()??[];
    data['attractionCode'] = attractionCode?.map((item) {return item.toJson();})?.toList()??[];
    data['dateStyleCode'] = dateStyleCode?.map((item) {return item.toJson();})?.toList()??[];
    data['areaCode'] = areaCode?.map((item) {return item.toJson();})?.toList()??[];
    data['pointCode'] = pointCode?.map((item) {return item.toJson();})?.toList()??[];
    data['adminAccessCode'] = adminAccessCode?.map((item) {return item.toJson();})?.toList()??[];
    data['loungeCategoryCode'] = loungeCategoryCode?.map((item) {return item.toJson();})?.toList()??[];
    data['communityReportCode'] = communityReportCode?.map((item) {return item.toJson();})?.toList()??[];
    data['partyCategoryCode'] = partyCategoryCode?.map((item) {return item.toJson();})?.toList()??[];
    data['reportCode'] = reportCode?.map((item) {return item.toJson();})?.toList()??[];
    data['alarmCode'] = alarmCode?.map((item) {return item.toJson();})?.toList()??[];
    data['noticeList'] = noticeList?.map((item) {return item.toJson();})?.toList()??[];
    return data;
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

class CodeInfoVo {

  String?	code;	//코드
  String?	title;	//내용
  String?	upperCode;	//상위코드
  String?	etc;	//기타기능

  CodeInfoVo({
    this.code,
    this.title,
    this.upperCode,
    this.etc,

  });

  CodeInfoVo.fromJson(Map<String , dynamic> data) {
    code = data['code']??"";
    title = data['title']??"";
    upperCode = data['upperCode']??"";
    etc = data['etc']??"";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['code'] = code??"";
    data['title'] = title??"";
    data['upperCode'] = upperCode??"";
    data['etc'] = etc??"";

    return data;
  }




}