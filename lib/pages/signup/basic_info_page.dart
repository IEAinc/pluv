import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';

import '../../component/custom_dialog.dart';
import '../../controller/auth_controller.dart';
import '../../controller/status_controller.dart';
import '../../global/global.dart';
import 'dart:developer';
///BasicInfoPage
///담당자 : ---

class BasicInfoPage extends StatefulWidget {
  const BasicInfoPage({Key? key}) : super(key: key);

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {

  @override
  void initState() {
    super.initState();
    logger.i("BasicInfoPage");
    areaDetailList = statusController.getAreaDetail(prefs.getString('tmp_areaDetailCode')??'RE_GU_SE');


    memberInfo['nickName'] = prefs.getString('tmp_nickName')??"";
    memberInfo['areaCode'] = prefs.getString('tmp_areaCode')??"";
    memberInfo['areaDetailCode'] = prefs.getString('tmp_areaDetailCode')??"";
    memberInfo['memberHeight'] = prefs.getString('tmp_memberHeight')??"";
    memberInfo['memberJob'] = prefs.getString('tmp_memberJob')??"";
    memberInfo['bodyFormCode'] = prefs.getString('tmp_bodyFormCode')??"";
    memberInfo['drinkCode'] = prefs.getString('tmp_drinkCode')??"";
    memberInfo['smoke'] = prefs.getBool('tmp_smoke')??false;
    memberInfo['religionCode'] = prefs.getString('tmp_religionCode')??"";
    nickNameController = TextEditingController(text: memberInfo['nickName']);
    tallController = TextEditingController(text: memberInfo['memberHeight']);
    jobController = TextEditingController(text: memberInfo['memberJob']);

    setState(() {

    });
  }
  final PageController _pageController = PageController(initialPage: 0);

  StatusController statusController = Get.find<StatusController>();
  AuthController authController = Get.find<AuthController>();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController tallController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  final _nickNameFormKey = GlobalKey<FormState>();
  final _tallFormKey = GlobalKey<FormState>();
  final _jobFormKey = GlobalKey<FormState>();

  int _currentIndex = 0;
  List<MapEntry<String, dynamic>> areaDetailList = [];
  Map<String,dynamic> memberInfo = {
    "nickName" : "",
    "areaCode" : "RE_GU_SE",
    "areaDetailCode" : "",
    "memberHeight" : "",
    "memberJob" : "",
    "bodyFormCode" : "",
    "drinkCode" : "",
    "smoke":false,
    "religionCode" : ""
  };
  int nickNameDuplicated = 0;





  void nextPage() async{


    //닉네임
    if(_currentIndex==0){

      if(memberInfo["nickName"]!.length >= 2 && memberInfo["nickName"]!.length <= 8) {

      }else{
        getCautionSnackbar("닉네임을 바르게 입력해주세요");
      }

      if(_nickNameFormKey.currentState!.validate()){
        _nickNameFormKey.currentState!.save();
        //shared 임시저장
        prefs.setString('tmp_nickName', memberInfo["nickName"]);
        goNext();
      }else{
        getCautionSnackbar("닉네임을 바르게 입력해주세요.");
      }

    }
    //지역
    else if(_currentIndex==1){
      if(memberInfo["areaCode"] != "" && memberInfo["areaDetailCode"] != "") {
        //shared 임시저장
        prefs.setString('tmp_areaCode', memberInfo["areaCode"]);
        prefs.setString('tmp_areaDetailCode', memberInfo["areaDetailCode"]);

        goNext();
      }else{
        getCautionSnackbar("지역을 선택해 주세요");
      }
    }
    //키
    else if(_currentIndex==2){

      if(_tallFormKey.currentState!.validate()){
        _tallFormKey.currentState!.save();

        prefs.setString('tmp_memberHeight', memberInfo["memberHeight"]);
        goNext();
      }else{
        getCautionSnackbar("키를 바르게 입력해주세요.");
      }



    }
    //직업
    else if(_currentIndex==3){

      if(_jobFormKey.currentState!.validate()){
        _jobFormKey.currentState!.save();
        prefs.setString('tmp_memberJob', memberInfo["memberJob"]);
        goNext();
      }else{
        getCautionSnackbar("직업을 바르게 입력해주세요.");
      }


    }
    //체형
    else if(_currentIndex==4){
      if(memberInfo["bodyFormCode"] != null && memberInfo["bodyFormCode"] != ""){

        prefs.setString('tmp_bodyFormCode', memberInfo["bodyFormCode"]);
        goNext();
      }else{
        getCautionSnackbar("체형을 선택해 주세요.");
      }


    }
    //음주
    else if(_currentIndex==5){

      if(memberInfo["drinkCode"] != null && memberInfo["drinkCode"] != ""){

        prefs.setString('tmp_drinkCode', memberInfo["drinkCode"]);
        goNext();
      }else{
        getCautionSnackbar("음주 스타일을 선택해 주세요.");
      }
    }
    //흡연
    else if(_currentIndex==6){
      prefs.setBool('tmp_smoke', memberInfo["smoke"]);
      goNext();
    }
    //종교
    else if(_currentIndex==7){

      try{
        if(memberInfo["religionCode"] != null && memberInfo["religionCode"] != ""){
          prefs.setString('tmp_religionCode', memberInfo["religionCode"]);
          authController.myInfo!.profileStatus!.step1 = true;
          authController.myInfo!.nickName = memberInfo['nickName'];
          authController.myInfo!.areaCode = memberInfo['areaCode'];
          authController.myInfo!.areaDetailCode = memberInfo['areaDetailCode'];
          authController.myInfo!.memberHeight = int.parse(memberInfo['memberHeight']);
          authController.myInfo!.memberJob = memberInfo['memberJob'];
          authController.myInfo!.bodyFormCode = memberInfo['bodyFormCode'];
          authController.myInfo!.drinkCode = memberInfo['drinkCode'];
          authController.myInfo!.smoke = memberInfo['smoke'];
          authController.myInfo!.religionCode = memberInfo['religionCode'];
          await authController.updateMember();
          goNext();
        }else{
          getCautionSnackbar("종교를 선택해 주세요.");
        }
      }catch(error){
        throw error;
      }



    }
    else if(_currentIndex==8){
      logger.e(8);
      Get.back();
    }else{}




  }
  void goNext(){
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void goPrev(){
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            title: "기본정보",
            backFunction:(){

              if(_currentIndex==0 || _currentIndex==8 ){
                Get.back();
              }else{
                goPrev();
              }
            }
        ),
        body: Column(
          children: [
            if(_currentIndex<8)
            Row(
              children: [
                Container(width: (Get.width/8)*(_currentIndex+1),height: 2,color: appColorPrimary2,),
                Expanded(child: Container(width: Get.width,height: 2,color: Colors.transparent,)),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PageView(

                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    page1_nickname(), // 닉네임
                    page2_area(), // 내가 살고있는 지역
                    page3_tall(),// 키
                    page4_job(),// 일
                    page5_body(),// 체형
                    page6_drink(),// 음주
                    page7_smoke(),// 흡연
                    page8_religion(),// 종교
                    page9_success(),// 1단계 가입완료

                  ],
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RectangleButton(mode: 1,name: "다음",action: (){
                nextPage();
              },),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  Column page1_nickname() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("사용하실 닉네임을\n입력해주세요.",style: TextStyles.title20_b,),
                      SizedBox(height: 50,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Expanded(
                            child: Form(
                              key: _nickNameFormKey,
                              child: TextFormField(
                                controller: nickNameController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (val) {
                                  if(val!.length > 8) {
                                    return '8글자 이내로 입력해주세요.';
                                  }
                                  if(val!.length < 2) {
                                    return '2글자 이상 입력해주세요.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  labelText: "8글자 이내로 입력해주세요.",
                                  labelStyle: TextStyles.contents15_g1,

                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColorGray1, width: 1),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColorPrimary2, width: 1),
                                  ),


                                ),
                                onChanged: (val){

                                  if(_nickNameFormKey.currentState!.validate()){
                                    _nickNameFormKey.currentState!.save();
                                    memberInfo["nickName"] = val;
                                  }
                                  setState(() {
                                    nickNameDuplicated = 0;
                                  });

                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: () async{

                              if(memberInfo["nickName"]!.length >= 2 && memberInfo["nickName"]!.length <= 8) {
                                bool duplicate = await authController.checkDiDuplicate(memberInfo["nickName"]);
                                if(duplicate){
                                  nickNameDuplicated=1;
                                }else{
                                  nickNameDuplicated=2;
                                }
                                setState(() {});
                              }

                            },
                            child: Container(

                                decoration: BoxDecoration(
                                    color: appColorPrimary2,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                child: Text("중복체크",style: TextStyles.sub_title12_w,)),
                          )
                        ],
                      ),
                      if(nickNameDuplicated==1)
                        Text("누군가 이미 사용하고있는 닉네임 입니다.\n닉네임은 중복 가능합니다",style: TextStyles.contents14_b.copyWith(color: appColorRed1),),
                      if(nickNameDuplicated==2)
                        Text("현재 아무도 사용하고 있지 않은 닉네임입니다.",style: TextStyles.contents14_b.copyWith(color: appColorPrimary),),
                    ],
                  );
  }
  Column page2_area() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("내가 살고 있는 지역을\n선택해주세요.",style: TextStyles.title20_b,),
                      SizedBox(height: 10,),
                      Text("가까운 거리에 있는 이성을 가장 먼저\n추천해드려요!",style: TextStyles.contents16_g1,),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: Get.height/3,
                        child: Row(
                          children: [

                            Expanded(
                                child: ListView.builder(
                                  itemCount: statusController.getArea().length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          memberInfo["areaCode"]=statusController.getArea()[index].key;
                                          areaDetailList = statusController.getAreaDetail(statusController.getArea()[index].key);
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: memberInfo["areaCode"]==statusController.getArea()[index].key?appColorPrimary.withOpacity(0.1):Colors.transparent,
                                            border: Border(top: index==0?BorderSide(color: appColorGray8):BorderSide.none,bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                                        ),
                                        child: Center(child: Text(statusController.getArea()[index].value)),
                                      ),
                                    );
                                  },
                                )
                            ),

                            SizedBox(width: 10,),
                            Expanded(
                                child: ListView.builder(
                                  itemCount: areaDetailList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){

                                        setState(() {
                                          memberInfo["areaDetailCode"] = areaDetailList[index].key;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: memberInfo["areaDetailCode"]==areaDetailList[index].key?appColorPrimary.withOpacity(0.1):Colors.transparent,
                                            border: Border(top: index==0?BorderSide(color: appColorGray8):BorderSide.none,bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                                        ),
                                        child: Center(child: Text(areaDetailList[index].value)),
                                      ),
                                    );
                                  },
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  );
  }
  Column page3_tall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${memberInfo['nickName']} 님의 키를\n입력해주세요.",style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("상대방에게 보여질 회원님의 키를\n입력해주세요!",style: TextStyles.contents16_g1,),
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Expanded(
              child: Form(
                key: _tallFormKey,
                child: TextFormField(
                  controller: tallController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  onChanged: (val){
                    if(_tallFormKey.currentState!.validate()){
                      _tallFormKey.currentState!.save();
                      setState(() {
                        memberInfo["memberHeight"] = val;
                      });
                    }
                  },
                  validator: (val) {

                    if (val!.length >3) {
                      return '3자리 숫자만 입력해주세요';
                    }

                    final number = int.tryParse(val);
                    if (number == null) {
                      return '3자리 숫자만 입력해주세요';
                    }
                    if (number >200) {
                      return '올바른 키를 입력해주세요';
                    }
                    return null;

                  },
                  decoration: InputDecoration(

                    labelText: "본인의 키를 입력해주세요(소수점없이)",
                    labelStyle: TextStyles.contents15_g1,

                    isDense: true,
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("cm",style: TextStyles.contents16_b,),
                      ],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appColorGray1, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appColorPrimary2, width: 1),
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Column page4_job() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("어떤 일을 하시나요?",style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("상대방에게 소개할 회원님의 직업을\n소개해주세요!",style: TextStyles.contents16_g1,),
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Expanded(
              child: Form(
                key: _jobFormKey,
                child: TextFormField(
                  controller: jobController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (val){
                    if(_jobFormKey.currentState!.validate()){
                      _jobFormKey.currentState!.save();
                      setState(() {
                        memberInfo["memberJob"] = val;
                      });
                    }
                  },
                  validator: (val) {
                    if(val!.length > 8) {
                      return '8글자 이내로 입력해주세요.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    labelText: "본인의 직업을 입력해주세요.",
                    labelStyle: TextStyles.contents15_g1,
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appColorGray1, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appColorPrimary2, width: 1),
                    ),

                  ),
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
  Column page5_body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${memberInfo["nickName"]} 님의\n체형을 선택해주세요.",style: TextStyles.title20_b,),
        SizedBox(height: 50,),
        Expanded(
            child: ListView.builder(
              itemCount: statusController.appInfo.bodyFormCodeEntryList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      memberInfo["bodyFormCode"]=statusController.appInfo.bodyFormCodeEntryList![index].key;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: memberInfo["bodyFormCode"]==statusController.appInfo.bodyFormCodeEntryList![index].key?appColorPrimary.withOpacity(0.1):Colors.transparent,
                        border: Border(top: index==0?BorderSide(color: appColorGray8):BorderSide.none,bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                    ),
                    child: Center(child: Text(statusController.appInfo.bodyFormCodeEntryList![index].value)),
                  ),
                );
              },
            )
        ),

      ],
    );
  }
  Column page6_drink() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("음주 스타일을 선택해주세요.",style: TextStyles.title20_b,),
        SizedBox(height: 50,),
        Expanded(
            child: ListView.builder(
              itemCount: statusController.appInfo.drinkCodeEntryList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      memberInfo["drinkCode"]=statusController.appInfo.drinkCodeEntryList![index].key;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: memberInfo["drinkCode"]==statusController.appInfo.drinkCodeEntryList![index].key?appColorPrimary.withOpacity(0.1):Colors.transparent,
                        border: Border(top: index==0?BorderSide(color: appColorGray8):BorderSide.none,bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                    ),
                    child: Center(child: Text(statusController.appInfo.drinkCodeEntryList![index].value)),
                  ),
                );
              },
            )
        ),

      ],
    );
  }
  Column page7_smoke() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("흡연 여부를 선택 해주세요",style: TextStyles.title20_b,),
        SizedBox(height: 50,),
        Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  memberInfo["smoke"]=true;
                });
              },
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: memberInfo["smoke"]==true?appColorPrimary.withOpacity(0.1):Colors.transparent,
                    border: Border(top: BorderSide(color: appColorGray8),bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                ),
                child: Center(child: Text("흡연")),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  memberInfo["smoke"]=false;
                });
              },
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: memberInfo["smoke"]==false?appColorPrimary.withOpacity(0.1):Colors.transparent,
                    border: Border(top: BorderSide.none,bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                ),
                child: Center(child: Text("비흡연")),
              ),
            ),
          ],
        ),

      ],
    );
  }
  Column page8_religion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("종교를 선택해주세요.",style: TextStyles.title20_b,),
        SizedBox(height: 50,),
        Expanded(
            child: ListView.builder(
              itemCount: statusController.appInfo.religionCodeEntryList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      memberInfo["religionCode"]=statusController.appInfo.religionCodeEntryList![index].key;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: memberInfo["religionCode"]==statusController.appInfo.religionCodeEntryList![index].key?appColorPrimary.withOpacity(0.1):Colors.transparent,
                        border: Border(top: index==0?BorderSide(color: appColorGray8):BorderSide.none,bottom: BorderSide(color: appColorGray8), left:BorderSide(color: appColorGray8),right: BorderSide(color: appColorGray8) )
                    ),
                    child: Center(child: Text(statusController.appInfo.religionCodeEntryList![index].value)),
                  ),
                );
              },
            )
        ),

      ],
    );
  }
  Column page9_success() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/icon/step1ok.svg',),
        SizedBox(height: 50,),
        Text("1단계 가입이 완료 되었습니다.",style: TextStyles.title20_b,),
        SizedBox(height: 20,),
        Text("프로톡 1단계 가입이 완료 되었습니다.\n프로필 작성을 통해 좀더 매력을\n어필해보세요" , textAlign: TextAlign.center,style: TextStyles.sub_title16_g1,),
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/icon/caution.svg',),
            SizedBox(width: 5,),
            Text("허위 프로필 작성시 계정 정지 및 신고 조치 등의\n불이익을 받을 수 있으므로 주의해주시기 바랍니다.",style: TextStyles.contents14_b,),
          ],
        ),


      ],
    );
  }
}
