import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/model/vo/lounge_vo.dart';
import 'package:pluv/model/vo/member_vo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../controller/auth_controller.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';
import '../../global/my_firebase_service.dart';
import '../../model/dto/lounge_dto.dart';
import '../../model/vo/comment_vo.dart';

///RatingScreen
///담당자 : ---

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("RatingScreen");
  }

  DataController _dataController = Get.find<DataController>();
  AuthController _authController = Get.find<AuthController>();
  StatusController _statusController = Get.find<StatusController>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  void setAppInfo() async {
    try {
      await masterCollection.doc('system_v2').update({


        'bodyFormCode': [

          {"code":'CO_BO_01',"title": '마름'},
          {"code":'CO_BO_02',"title": '슬림한'},
          {"code":'CO_BO_03',"title": '보통'},
          {"code":'CO_BO_04',"title": '통통함'},
          {"code":'CO_BO_05',"title": '볼륨감 있는'},
          {"code":'CO_BO_06',"title": '근육질의'},
        ],

        'drinkCode': [

          {"code":'CO_DR_01',"title": '전혀 못 마셔요'},
          {"code":'CO_DR_02',"title": '가끔 마셔요'},
          {"code":'CO_DR_03',"title": '어느정도 즐겨요'},
          {"code":'CO_DR_04',"title": '술자리를 좋아해요'},
        ],
        'religionCode': [

          {"code":'CO_RE_01',"title": '무교'},
          {"code":'CO_RE_02',"title": '기독교'},
          {"code":'CO_RE_03',"title": '천주교'},
          {"code":'CO_RE_04',"title": '불교'},
          {"code":'CO_RE_05',"title": '기타종교'},
        ],
        'personalityCode': [

          {"code":'PR_PE_01',"title":'자주웃는'},
          {"code":'PR_PE_02',"title":'상냥한'},
          {"code":'PR_PE_03',"title":'표현이 많은'},
          {"code":'PR_PE_04',"title":'다정다감한'},
          {"code":'PR_PE_05',"title":'애교많은'},
          {"code":'PR_PE_06',"title":'차분한'},
          {"code":'PR_PE_07',"title":'외향적인'},
          {"code":'PR_PE_08',"title":'듬직한'},
          {"code":'PR_PE_09',"title":'지적인'},
          {"code":'PR_PE_10',"title":'감성적인'},
          {"code":'PR_PE_11',"title":'열정적인'},
          {"code":'PR_PE_12',"title":'낙천적인'},
          {"code":'PR_PE_13',"title":'솔직한'},
          {"code":'PR_PE_14',"title":'귀여운'},
          {"code":'PR_PE_15',"title":'배려심있는'},
          {"code":'PR_PE_16',"title":'유머있는'},
          {"code":'PR_PE_17',"title":'섬세한'},
          {"code":'PR_PE_18',"title":'이야기잘들어주는'},
        ],
        'interestCode': [
          {"code":'PR_IN_01',"title":'음식'},
          {"code":'PR_IN_02',"title":'반려동물'},
          {"code":'PR_IN_03',"title":'영화'},
          {"code":'PR_IN_04',"title":'여행'},
          {"code":'PR_IN_05',"title":'연애'},
          {"code":'PR_IN_06',"title":'학문'},
          {"code":'PR_IN_07',"title":'정치/시사'},
          {"code":'PR_IN_08',"title":'하이킹'},
          {"code":'PR_IN_09',"title":'공연'},
          {"code":'PR_IN_10',"title":'게임'},
          {"code":'PR_IN_11',"title":'댄스'},
          {"code":'PR_IN_12',"title":'스포츠'},
          {"code":'PR_IN_13',"title":'자동차'},
          {"code":'PR_IN_14',"title":'패션'},
          {"code":'PR_IN_15',"title":'전시'},
          {"code":'PR_IN_16',"title":'사진'},
          {"code":'PR_IN_17',"title":'커피'},
          {"code":'PR_IN_18',"title":'그림'},
        ],
        'attractionCode': [
          {"code":'PR_AT_01',"title":'운동감각있는'},
          {"code":'PR_AT_02',"title":'노래를잘하는'},
          {"code":'PR_AT_03',"title":'손이예쁜'},
          {"code":'PR_AT_04',"title":'털털한'},
          {"code":'PR_AT_05',"title":'예의가 바른'},
          {"code":'PR_AT_06',"title":'경제력 있는'},
          {"code":'PR_AT_07',"title":'대화를 잘하는'},
          {"code":'PR_AT_08',"title":'뭐든 잘먹는'},
          {"code":'PR_AT_09',"title":'허세가 없는'},
          {"code":'PR_AT_10',"title":'장난끼 많은'},
          {"code":'PR_AT_11',"title":'요리를 잘하는'},
          {"code":'PR_AT_12',"title":'웃는게 예쁜'},
          {"code":'PR_AT_13',"title":'섹시한 두뇌의'},
          {"code":'PR_AT_14',"title":'몸매가 좋은'},
          {"code":'PR_AT_15',"title":'목소리가 좋은'},
          {"code":'PR_AT_16',"title":'체력이 좋은'},
          {"code":'PR_AT_17',"title":'패션감각이 있는'},
        ],
        'dateStyleCode': [
          {"code":'PR_DA_01',"code":'길게 통화하기'},
          {"code":'PR_DA_02',"code":'집 데이트'},
          {"code":'PR_DA_03',"code":'함께 운동하기'},
          {"code":'PR_DA_04',"code":'동반 여행'},
          {"code":'PR_DA_05',"code":'같이 산책하기'},
          {"code":'PR_DA_06',"code":'같이 게임하기'},
          {"code":'PR_DA_07',"code":'함께 술마시기'},
          {"code":'PR_DA_08',"code":'요리 해먹기'},
          {"code":'PR_DA_09',"code":'스포츠 관람하기'},
          {"code":'PR_DA_10',"code":'자주 통화하기'},
          {"code":'PR_DA_11',"code":'공원 나들이'},
          {"code":'PR_DA_12',"code":'공연/전시 구경'},
          {"code":'PR_DA_13',"code":'드라이브'},
          {"code":'PR_DA_14',"code":'카페 데이트'},
          {"code":'PR_DA_15',"code":'맛집투어'},
          {"code":'PR_DA_16',"code":'고궁 데이트'},
          {"code":'PR_DA_17',"code":'같이 만화책 보기'},
        ],
        'areaCode': [
          {"code":'RE_GU_SE_00',"title": '서울',"etc":"01","upperCode":""},
          {"code":'RE_GU_GY_00',"title": '경기',"etc":"01","upperCode":""},
          {"code":'RE_GU_IN_00',"title": '인천부천권',"etc":"01","upperCode":""},
          {"code":'RE_GU_CH_00',"title": '충청권',"etc":"01","upperCode":""},
          {"code":'RE_GU_GW_00',"title": '강원권',"etc":"01","upperCode":""},
          {"code":'RE_GU_JR_00',"title": '전라권',"etc":"01","upperCode":""},
          {"code":'RE_GU_GS_00',"title": '경상권',"etc":"01","upperCode":""},
          {"code":'RE_GU_JJ_00',"title": '제주권',"etc":"01","upperCode":""},
          {"code":'RE_GU_SE_01',"title": '강남서초',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_02',"title": '이태원한남',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_03',"title": '송파잠실',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_04',"title": '건대광진구',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_05',"title": '여의도목동',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_06',"title": '홍대',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_07',"title": '종로구',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_SE_08',"title": '성동구',"etc":"02", "upperCode":"RE_GU_SE_00"},
          {"code":'RE_GU_GY_01',"title": '분당수원',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_02',"title": '용인동탄화성',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_03',"title": '안양과천',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_04',"title": '김포일산파주',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_05',"title": '구리남양주',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_06',"title": '하남광주',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_07',"title": '동두천의정부포천',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_08',"title": '시흥안산',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_09',"title": '평택오산안성',"etc":"02", "upperCode":"RE_GU_GY_00"},
          {"code":'RE_GU_GY_10',"title": '양평여주',"etc":"02", "upperCode":"RE_GU_GY_10"},
          {"code":'RE_GU_IN_01',"title": '청라송도',"etc":"02", "upperCode":"RE_GU_IN_00"},
          {"code":'RE_GU_IN_02',"title": '계양구',"etc":"02", "upperCode":"RE_GU_IN_00"},
          {"code":'RE_GU_IN_03',"title": '부평',"etc":"02", "upperCode":"RE_GU_IN_00"},
          {"code":'RE_GU_IN_04',"title": '미추홀구',"etc":"02", "upperCode":"RE_GU_IN_00"},
          {"code":'RE_GU_CH_01',"title": '세종',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_CH_02',"title": '대전청주',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_CH_03',"title": '천안아산당진',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_CH_04',"title": '충주제천단양',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_CH_05',"title": '논산금산',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_CH_06',"title": '옥천보은',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_CH_07',"title": '청양홍성예산',"etc":"02", "upperCode":"RE_GU_CH_00"},
          {"code":'RE_GU_GW_01',"title": '춘천원주홍천',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_GW_02',"title": '철원화천양구',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_GW_03',"title": '양구인제고성',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_GW_04',"title": '양양강릉동해',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_GW_05',"title": '속초평창',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_GW_06',"title": '삼척태백',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_GW_07',"title": '정선영월',"etc":"02", "upperCode":"RE_GU_GW_00"},
          {"code":'RE_GU_JR_01',"title": '광주광역시',"etc":"02", "upperCode":"RE_GU_JR_00"},
          {"code":'RE_GU_JR_02',"title": '광양여수순천',"etc":"02", "upperCode":"RE_GU_JR_00"},
          {"code":'RE_GU_JR_03',"title": '목표신안무안',"etc":"02", "upperCode":"RE_GU_JR_00"},
          {"code":'RE_GU_JR_04',"title": '진도완도해남',"etc":"02", "upperCode":"RE_GU_JR_00"},
          {"code":'RE_GU_JR_05',"title": '보성화순고흥',"etc":"02", "upperCode":"RE_GU_JR_00"},
          {"code":'RE_GU_JR_06',"title": '담양나주함평',"etc":"02", "upperCode":"RE_GU_JR_00"},
          {"code":'RE_GU_GS_01',"title": '대구광역시',"etc":"02", "upperCode":"RE_GU_GS_00"},
          {"code":'RE_GU_GS_02',"title": '울산광역시',"etc":"02", "upperCode":"RE_GU_GS_00"},
          {"code":'RE_GU_GS_03',"title": '부산광역시',"etc":"02", "upperCode":"RE_GU_GS_00"},
          {"code":'RE_GU_GS_04',"title": '포항경주영천',"etc":"02", "upperCode":"RE_GU_GS_00"},
          {"code":'RE_GU_GS_05',"title": '김천구미의성',"etc":"02", "upperCode":"RE_GU_GS_00"},
          {"code":'RE_GU_GS_06',"title": '안성영천청도',"etc":"02", "upperCode":"RE_GU_GS_00"},
          {"code":'RE_GU_GS_99',"title": '경상권기타',"etc":"02", "upperCode":"RE_GU_GS_90"},
          {"code":'RE_GU_JJ_01',"title": '제주시',"etc":"02", "upperCode":"RE_GU_JJ_00"},
          {"code":'RE_GU_JJ_02',"title": '서귀포시',"etc":"02", "upperCode":"RE_GU_JJ_00"},
        ],
        'pointCode': [
          {"code":'PO_CH_01',"title":'포인트유료구매'},
          {"code":'PO_CH_02',"title":'최초신고보상'},
          {"code":'PO_CH_03',"title":'프로필평가보상'},
          {"code":'PO_CH_04',"title":'친구초대보상'},
          {"code":'PO_US_01',"title":'좋아요 사용'},
          {"code":'PO_US_02',"title":'슈퍼좋아요 사용'},
          {"code":'PO_US_03',"title":'상위매력회원카드받기'},
          {"code":'PO_US_04',"title":'내프로필 부스터'},
          {"code":'PO_US_05',"title":'이상형추천'},
          {"code":'PO_US_06',"title":'프로필 교환 신청'},
          {"code":'PO_US_07',"title":'회원파티초대'},
        ],
        'adminAccessCode': [
          {"code":'AU_AP_01',"title": '서류심사조회'},
          {"code":'AU_AP_02',"title": '서류심사관리'},
          {"code":'AU_AP_03',"title": '프로필심사조회'},
          {"code":'AU_AP_04',"title": '프로필심사관리'},
          {"code":'AU_EX_01',"title": '공지사항조회'},
          {"code":'AU_EX_02',"title": '공지사항관리'},
          {"code":'AU_EX_03',"title": '푸시/SMS조회'},
          {"code":'AU_EX_04',"title": '푸시/SMS관리'},
          {"code":'AU_EX_05',"title": 'FAQ조회'},
          {"code":'AU_EX_06',"title": 'FAQ관리'},
          {"code":'AU_EX_07',"title": '약관조회'},
          {"code":'AU_EX_08',"title": '약관관리'},
          {"code":'AU_RE_01',"title": '프로필신고조회'},
          {"code":'AU_RE_02',"title": '프로필신고처리'},
          {"code":'AU_RE_03',"title": '라운지신고조회'},
          {"code":'AU_RE_04',"title": '라운지신고처리'},
          {"code":'AU_RE_05',"title": '파티신고조회'},
          {"code":'AU_RE_06',"title": '파티신고처리'},
          {"code":'AU_RE_07',"title": '댓글신고열람'},
          {"code":'AU_RE_08',"title": '댓글신고처리'},
          {"code":'AU_CS_01',"title": '1:1문의조회'},
          {"code":'AU_CS_02',"title": '1:1문의처리(다른담당자의 건 답변권한)'},
          {"code":'AU_CM_01',"title": '라운지조회'},
          {"code":'AU_CM_02',"title": '라운지관리'},
          {"code":'AU_CM_03',"title": '파티조회'},
          {"code":'AU_CM_04',"title": '파티관리'},
          {"code":'AU_AD_01',"title": '관리자조회'},
          {"code":'AU_AD_02',"title": '관리자관리'},
          {"code":'AU_AD_03',"title": '권한조회'},
          {"code":'AU_AD_04',"title": '권한관리'},
          {"code":'AU_ME_01',"title": '회원조회'},
          {"code":'AU_ME_02',"title": '회원관리'},
        ],
        'reportCode': [
          {"code":'SY_RE_01',"title":'스팸'},
          {"code":'SY_RE_02',"title":'혐오발언'},
          {"code":'SY_RE_03',"title":'음란물'},
          {"code":'SY_RE_04',"title":'폭력 및 위협'},
          {"code":'SY_RE_05',"title":'허위 정보'},
          {"code":'SY_RE_06',"title":'개인정보유출'},
          {"code":'SY_RE_07',"title":'사기 및 피싱'},
          {"code":'SY_RE_08',"title":'부적절한 콘텐츠'},
          {"code":'SY_RE_09',"title":'커뮤니티신고기타'},
        ],
        'alarmCode': [
          {"code":'SY_AR_01',"title":'매칭성공알람'},
          {"code":'SY_AR_02',"title":'좋아요획득알람'},
          {"code":'SY_AR_03',"title":'슈퍼좋아요획득알람'},
          {"code":'SY_AR_04',"title":'파티초대받음알람'},
          {"code":'SY_AR_05',"title":'파티초대권받은사람수락알람'},
          {"code":'SY_AR_06',"title":'파티매칭성공알람'},
          {"code":'SY_AR_07',"title":'라운지댓글달림알람'},
          {"code":'SY_AR_08',"title":'상위평가알람'},
          {"code":'SY_AR_09',"title":'매칭추천도착알람'},
          {"code":'SY_AR_10',"title":'공지사항'},
          {"code":'SY_AR_11',"title":'이벤트'},
          {"code":'SY_AR_12',"title":'마케팅'},
        ],
        'loungeCategoryCode': [

          {"code": "CT_RO_01", "title": "셀프소개"},
          {"code": "CT_RO_02", "title": "자유"},
          {"code": "CT_RO_03", "title": "차량/인증"},
          {"code": "CT_RO_04", "title": "취미"},
          {"code": "CT_RO_05", "title": "썸/연애"},
          {"code": "CT_RO_06", "title": "19+"},
          {"code": "CT_RO_00", "title": "기타"},
        ],
        'partyCategoryCode': [

          {"code": "CT_PT_01", "title": "번개"},
          {"code": "CT_PT_02", "title": "2:2"},
          {"code": "CT_PT_00", "title": "기타"},
        ],



      });
    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  void d() async{
    print(auth.currentUser);

    // String? dd = await auth.currentUser?.getIdToken(false);


    // logger.e(dd);

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusController>(
      builder: (controller) {
        return Container(
          child: Column(
            children: [
              GestureDetector(
                            onTap: (){
                              setAppInfo();
                            },
                            child: Text("실험용버튼"),
                          ),

              Center(child: Text("프로필 심사회원 평가하는 곳"))
            ],
          ),
        );
      }
    );
  }
}
