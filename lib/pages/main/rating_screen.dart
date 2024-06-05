import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  List<LoungeDto>? items;

  void setAppInfo() async {
    try {
      await masterCollection.doc('system').update({

        'bodyFormCode' : {
          'CO_BO_01':'마름',
          'CO_BO_02':'슬림한',
          'CO_BO_03':'보통',
          'CO_BO_04':'통통함',
          'CO_BO_05':'볼륨감 있는',
          'CO_BO_06':'근육질의',
        },
        'drinkCode' : {
          'CO_DR_01':'전혀 못 마셔요',
          'CO_DR_02':'가끔 마셔요',
          'CO_DR_03':'어느정도 즐겨요',
          'CO_DR_04':'술자리를 좋아해요',
        },
        'religionCode' : {
          'CO_RE_01':'무교',
          'CO_RE_02':'기독교',
          'CO_RE_03':'천주교',
          'CO_RE_04':'불교',
          'CO_RE_05':'기타종교',

        },
        'personalityCode' : {
          'PR_PE_01':'자주웃는',
          'PR_PE_02':'상냥한',
          'PR_PE_03':'표현이 많은',
          'PR_PE_04':'다정다감한',
          'PR_PE_05':'애교많은',
          'PR_PE_06':'차분한',
          'PR_PE_07':'외향적인',
          'PR_PE_08':'듬직한',
          'PR_PE_09':'지적인',
          'PR_PE_10':'감성적인',
          'PR_PE_11':'열정적인',
          'PR_PE_12':'낙천적인',
          'PR_PE_13':'솔직한',
          'PR_PE_14':'귀여운',
          'PR_PE_15':'배려심있는',
          'PR_PE_16':'유머있는',
          'PR_PE_17':'섬세한',
          'PR_PE_18':'이야기잘들어주는',
        },
        'interestCode' : {
          'PR_IN_01':'음식',
          'PR_IN_02':'반려동물',
          'PR_IN_03':'영화',
          'PR_IN_04':'여행',
          'PR_IN_05':'연애',
          'PR_IN_06':'학문',
          'PR_IN_07':'정치/시사',
          'PR_IN_08':'하이킹',
          'PR_IN_09':'공연',
          'PR_IN_10':'게임',
          'PR_IN_11':'댄스',
          'PR_IN_12':'스포츠',
          'PR_IN_13':'자동차',
          'PR_IN_14':'패션',
          'PR_IN_15':'전시',
          'PR_IN_16':'사진',
          'PR_IN_17':'커피',
          'PR_IN_18':'그림',

        },
        'attractionCode' : {
          'PR_AT_01':'운동감각있는',
          'PR_AT_02':'노래를잘하는',
          'PR_AT_03':'손이예쁜',
          'PR_AT_04':'털털한',
          'PR_AT_05':'예의가 바른',
          'PR_AT_06':'경제력 있는',
          'PR_AT_07':'대화를 잘하는',
          'PR_AT_08':'뭐든 잘먹는',
          'PR_AT_09':'허세가 없는',
          'PR_AT_10':'장난끼 많은',
          'PR_AT_11':'요리를 잘하는',
          'PR_AT_12':'웃는게 예쁜',
          'PR_AT_13':'섹시한 두뇌의',
          'PR_AT_14':'몸매가 좋은',
          'PR_AT_15':'목소리가 좋은',
          'PR_AT_16':'체력이 좋은',
          'PR_AT_17':'패션감각이 있는',
        },
        'dateStyleCode' : {
          'PR_DA_01':'길게 통화하기',
          'PR_DA_02':'집 데이트',
          'PR_DA_03':'함께 운동하기',
          'PR_DA_04':'동반 여행',
          'PR_DA_05':'같이 산책하기',
          'PR_DA_06':'같이 게임하기',
          'PR_DA_07':'함께 술마시기',
          'PR_DA_08':'요리 해먹기',
          'PR_DA_09':'스포츠 관람하기',
          'PR_DA_10':'자주 통화하기',
          'PR_DA_11':'공원 나들이',
          'PR_DA_12':'공연/전시 구경',
          'PR_DA_13':'드라이브',
          'PR_DA_14':'카페 데이트',
          'PR_DA_15':'맛집투어',
          'PR_DA_16':'고궁 데이트',
          'PR_DA_17':'같이 만화책 보기',
        },
        'areaCode' : {
          'RE_GU_SE':'서울',
          'RE_GU_GY':'경기',
          'RE_GU_IN':'인천부천권',
          'RE_GU_CH':'충천권',
          'RE_GU_GW':'강원권',
          'RE_GU_JR':'전라권',
          'RE_GU_GS':'경상권',
          'RE_GU_JJ':'제주권',
          'RE_GU_SE_01':'강남서초',
          'RE_GU_SE_02':'이태원한남',
          'RE_GU_SE_03':'송파잠실',
          'RE_GU_SE_04':'건대광진구',
          'RE_GU_SE_05':'여의도목동',
          'RE_GU_SE_06':'홍대',
          'RE_GU_SE_07':'종로구',
          'RE_GU_SE_08':'성동구',
          'RE_GU_GY_01':'분당수원',
          'RE_GU_GY_02':'용인동탄화성',
          'RE_GU_GY_03':'안양과천',
          'RE_GU_GY_04':'김포일산파주',
          'RE_GU_GY_05':'구리남양주',
          'RE_GU_GY_06':'하남광주',
          'RE_GU_GY_07':'동두천의정부포천',
          'RE_GU_GY_08':'시흥안산',
          'RE_GU_GY_09':'평택오산안성',
          'RE_GU_GY_10':'양평여주',
          'RE_GU_IN_01':'청라송도',
          'RE_GU_IN_02':'계양구',
          'RE_GU_IN_03':'부평',
          'RE_GU_IN_04':'미추홀구',
          'RE_GU_CH_01':'세종',
          'RE_GU_CH_02':'대전청주',
          'RE_GU_CH_03':'천안아산당진',
          'RE_GU_CH_04':'충주제천단양',
          'RE_GU_CH_05':'논산금산',
          'RE_GU_CH_06':'옥천보은',
          'RE_GU_CH_07':'청양홍성예산',
          'RE_GU_GW_01':'춘천원주홍천',
          'RE_GU_GW_02':'철원화천양구',
          'RE_GU_GW_03':'양구인제고성',
          'RE_GU_GW_04':'양양강릉동해',
          'RE_GU_GW_05':'속초평창',
          'RE_GU_GW_06':'삼척태백',
          'RE_GU_GW_07':'정선영월',
          'RE_GU_JR_01':'광주광역시',
          'RE_GU_JR_02':'광양여수순천',
          'RE_GU_JR_03':'목표신안무안',
          'RE_GU_JR_04':'진도완도해남',
          'RE_GU_JR_05':'보성화순고흥',
          'RE_GU_JR_06':'담양나주함평',
          'RE_GU_GS_01':'대구광역시',
          'RE_GU_GS_02':'울산광역시',
          'RE_GU_GS_03':'부산광역시',
          'RE_GU_GS_04':'포항경주영천',
          'RE_GU_GS_05':'김천구미의성',
          'RE_GU_GS_06':'안성영천청도',
          'RE_GU_GS_ETC':'경상권기타',
          'RE_GU_JJ_01':'제주시',
          'RE_GU_JJ_02':'서귀포시',

        },
        'pointCode' : {
          'PO_CH_01':'포인트유료구매',
          'PO_CH_02':'최초신고보상',
          'PO_CH_03':'프로필평가보상',
          'PO_CH_04':'친구초대보상',
          'PO_US_01':'좋아요 사용',
          'PO_US_02':'슈퍼좋아요 사용',
          'PO_US_03':'상위매력회원카드받기',
          'PO_US_04':'내프로필 부스터',
          'PO_US_05':'이상형추천',
          'PO_US_06':'프로필 교환 신청',
          'PO_US_07':'회원파티초대',

        },
        'adminAccessCode' : {
          'AU_AP_01':'서류심사조회',
          'AU_AP_02':'서류심사관리',
          'AU_AP_03':'프로필심사조회',
          'AU_AP_04':'프로필심사관리',
          'AU_EX_01':'공지사항조회',
          'AU_EX_02':'공지사항관리',
          'AU_EX_03':'푸시/SMS조회',
          'AU_EX_04':'푸시/SMS관리',
          'AU_EX_05':'FAQ조회',
          'AU_EX_06':'FAQ관리',
          'AU_EX_07':'약관조회',
          'AU_EX_08':'약관관리',
          'AU_RE_01':'프로필신고조회',
          'AU_RE_02':'프로필신고처리',
          'AU_RE_03':'라운지신고조회',
          'AU_RE_04':'라운지신고처리',
          'AU_RE_05':'파티신고조회',
          'AU_RE_06':'파티신고처리',
          'AU_RE_07':'댓글신고열람',
          'AU_RE_08':'댓글신고처리',
          'AU_CS_01':'1:1문의조회',
          'AU_CS_02':'1:1문의처리(다른담당자의 건 답변권한)',
          'AU_CM_01':'라운지조회',
          'AU_CM_02':'라운지관리',
          'AU_CM_03':'파티조회',
          'AU_CM_04':'파티관리',
          'AU_AD_01':'관리자조회',
          'AU_AD_02':'관리자관리',
          'AU_AD_03':'권한조회',
          'AU_AD_04':'권한관리',
          'AU_ME_01':'회원조회',
          'AU_ME_02':'회원관리',
        },
        'loungeCategoryCode' : {
          'CT_RO_01':'셀프소개',
          'CT_RO_02':'자유',
          'CT_RO_03':'차량/인증',
          'CT_RO_04':'취미',
          'CT_RO_05':'썸/연애',
          'CT_RO_06':'19+',
          'CT_RO_00':'기타',

        },
        'reportCode' : {
          'SY_RE_01':'스팸',
          'SY_RE_02':'혐오발언',
          'SY_RE_03':'음란물',
          'SY_RE_04':'폭력 및 위협',
          'SY_RE_05':'허위 정보',
          'SY_RE_06':'개인정보유출',
          'SY_RE_07':'사기 및 피싱',
          'SY_RE_08':'부적절한 콘텐츠',
          'SY_RE_09':'커뮤니티신고기타',

        },
        'partyCategoryCode' : {
          'CT_PT_01':'번개',
          'CT_PT_02':'2:2',
          'CT_PT_00':'기타',
        },
        'alarmCode' : {
          'SY_AR_01':'매칭성공알람',
          'SY_AR_02':'좋아요획득알람',
          'SY_AR_03':'슈퍼좋아요획득알람',
          'SY_AR_04':'파티초대받음알람',
          'SY_AR_05':'파티초대권받은사람수락알람',
          'SY_AR_06':'파티매칭성공알람',
          'SY_AR_07':'라운지댓글달림알람',
          'SY_AR_08':'상위평가알람',
          'SY_AR_09':'매칭추천도착알람',

        },
        'paperCode' : {
          'PEPER_INCOME':'소득',
          'PEPER_INCOME_01':'자산',
          'PEPER_INCOME_02':'부동산',
          'PEPER_INCOME_03':'현금',
          'PEPER_INCOME_04':'주식',
          'PEPER_INCOME_05':'기타소득',
          'PEPER_HOME':'집안',
          'PEPER_JOB':'직업',
          'PEPER_JOB_01':'전문직',
          'PEPER_JOB_02':'사업가',
          'PEPER_JOB_03':'대기업',
          'PEPER_JOB_04':'공무원',
          'PEPER_JOB_05':'외국계',
          'PEPER_CAR':'차량',
          'PEPER_SCHOOL':'학벌',
        },

      });
    } catch (error) {
      throw Exception('Error : $error');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusController>(
      builder: (controller) {
        return Container(
          child: Column(
            children: [
              GestureDetector(

                  onTap: () async{

                    logger.e(controller.appInfo.toJson());
                    // MemberVo my = MemberVo(
                    //     memberEmail: "matoda4113@gmail.com",
                    //     memberName: "이성훈",
                    //     memberBirth: "900317",
                    //     memberGender: true,
                    //     memberPhone: "010-9664-4113",
                    //     fcmToken: "token",
                    //
                    // );
                    // my.test = true;
                    // my.memberPassword = "12341234";
                    // my.memberDivision = 2;
                    // _authController.addMember(my);
                    // logger.e(my.toJson());


                    setState(() {});
                  },
                  child:Text("SD")

              ),
              (items==null || items!.length==0)?Container(): Expanded(
                child: ListView.separated(
                  itemCount: items!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Text("SD"),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10,);
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
