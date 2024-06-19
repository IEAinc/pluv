import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';

import '../../controller/status_controller.dart';
import '../../global/global.dart';

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
    areaDetailList = statusController.getAreaDetail('RE_GU_SE');
  }
  final PageController _pageController = PageController(initialPage: 0);

  StatusController statusController = Get.find<StatusController>();
  int _currentIndex = 0;

  List<MapEntry<String, dynamic>> areaDetailList = [];

  String tmpNickName = "";
  Map<String,dynamic> memberInfo = {
    "nickName" : "",
    "areaCode" : "RE_GU_SE",
    "areaDetailCode" : "",
    "bodyFormCode" : "",
    "drinkCode" : "",
    "smoke":null,
    "religionCode" : ""
  };
  TextEditingController nickNameController = TextEditingController();

  void nextPage(){


    if(_currentIndex==0){
      logger.e(0);
      goNext();
    }
    else if(_currentIndex==1){
      logger.e(1);
      goNext();
    }
    else if(_currentIndex==2){
      logger.e(2);
      goNext();
    }
    else if(_currentIndex==3){
      logger.e(3);
      goNext();
    }
    else if(_currentIndex==4){
      logger.e(4);
      goNext();
    }
    else if(_currentIndex==5){
      goNext();
    }
    else if(_currentIndex==6){
      goNext();
    }
    else if(_currentIndex==7){
      goNext();
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
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: nickNameController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if(val!.length > 8) {
                                  return '한글 8글자 이내로 입력해주세요.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(

                                labelText: "한글 8글자 이내로 입력해주세요.",
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
                                setState(() {
                                  tmpNickName = val;
                                });

                              },
                            ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){

                              //중복체크 통과하면
                              setState(() {
                                memberInfo["nickName"] = tmpNickName;
                              });
                            },
                            child: Container(

                                decoration: BoxDecoration(
                                    color: appColorPrimary2,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                child: Text("중복체크",style: TextStyles.sub_title12_w,)),
                          )
                        ],
                      ),
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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if(val!.length > 8) {
                    return '한글 8글자 이내로 입력해주세요.';
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
