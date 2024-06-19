import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../component/rectangle_button.dart';
import '../../controller/status_controller.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///ProfileInfoPage
///담당자 : ---

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {

  @override
  void initState() {
    super.initState();
    logger.i("ProfileInfoPage");
  }


  final PageController _pageController = PageController(initialPage: 0);

  StatusController statusController = Get.find<StatusController>();
  int _currentIndex = 0;

  Map<String,List<String>> memberInfo1 = {
    "personalityCode" : [],
    "interestCode" : [],
    "attractionCode" : [],
    "dateStyleCode" : [],
  };
  Map<String,dynamic> mbti={
    "a":null,
    "b":null,
    "c":null,
    "d":null,
  };


  TextEditingController nickNameController = TextEditingController();

  void nextPage(){

    if(_currentIndex==0){
      goNext();
    }
    else if(_currentIndex==1){
      goNext();
    }
    else if(_currentIndex==2){
      goNext();
    }
    else if(_currentIndex==3){
      goNext();
    }
    else if(_currentIndex==4){
      goNext();
    }
    else if(_currentIndex==5){
      Get.back();
    } else{}
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
            title: "프로필 작성",
            backFunction:(){

              if(_currentIndex==0 || _currentIndex==5 ){
                Get.back();
              }else{
                goPrev();
              }


            }
        ),
        body: Column(
          children: [
            if(_currentIndex<5)
              Row(
                children: [
                  Container(width: (Get.width/5)*(_currentIndex+1),height: 2,color: appColorPrimary2,),
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
                    page1_personality(), // 성격
                    page2_interest(), // 관심
                    page3_attraction(),// 매력
                    page4_date_style(),// 데이트스타일
                    page5_mbti(),// mbti
                    page6_success(),// 2단계완료
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

  Column page1_personality() {

    List<MapEntry<String, dynamic>> target = statusController.appInfo.personalityCodeEntryList!;
    List<String> info = memberInfo1['personalityCode']!;
    int count = 3;
    String title= "본인의 성격을 나타내는\n키워드를 선택하세요.";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("(${count}가지 선택 가능)",style: TextStyles.contents16_g1,),
        SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 그리드 열 수
                childAspectRatio: 4/1,
            ),
            itemCount: target.length, //
            itemBuilder: (BuildContext context, int index) {
              MapEntry<String, dynamic> item = target[index];
              // index에 따라 각 아이템을 생성
              return GestureDetector(
                onTap: (){
                  setState(() {
                    if(info.contains(item.key)){
                      info.remove(item.key);
                    }else{
                      if(info.length>=count){
                        info.removeLast();
                      }
                      info.add(item.key);
                    }
                  });
                },
                child: Container(
                  child: Center(child: Text(item.value)),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: appColorGray8, width: 1),
                      left: BorderSide(color: appColorGray8, width: 1),
                      right: (index % 2 == 1) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                      bottom: (index >= target.length - 2) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                    ),
                    color: info.contains(item.key)?appColorPrimary.withOpacity(0.1):Colors.transparent
                  ),
                ),
              ); //
            },

          ),
        ),
      ],
    );
  }
  Column page2_interest() {
    List<MapEntry<String, dynamic>> target = statusController.appInfo.interestCodeEntryList!;
    List<String> info = memberInfo1['interestCode']!;
    int count = 6;
    String title= "저는 이런것에 관심이 있어요.";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("(${count}가지 선택 가능)",style: TextStyles.contents16_g1,),
        SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 그리드 열 수
              childAspectRatio: 4/1,
            ),
            itemCount: target.length, //
            itemBuilder: (BuildContext context, int index) {
              MapEntry<String, dynamic> item = target[index];
              // index에 따라 각 아이템을 생성
              return GestureDetector(
                onTap: (){
                  setState(() {
                    if(info.contains(item.key)){
                      info.remove(item.key);
                    }else{
                      if(info.length>=count){
                        info.removeLast();
                      }
                      info.add(item.key);
                    }
                  });
                },
                child: Container(
                  child: Center(child: Text(item.value)),
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: appColorGray8, width: 1),
                        left: BorderSide(color: appColorGray8, width: 1),
                        right: (index % 2 == 1) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                        bottom: (index >= target.length - 2) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                      ),
                      color: info.contains(item.key)?appColorPrimary.withOpacity(0.1):Colors.transparent
                  ),
                ),
              ); //
            },

          ),
        ),
      ],
    );
  }
  Column page3_attraction() {
    List<MapEntry<String, dynamic>> target = statusController.appInfo.attractionCodeEntryList!;
    List<String> info = memberInfo1['attractionCode']!;
    int count = 6;
    String title= "저는 이런 매력이 있어요.";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("(${count}가지 선택 가능)",style: TextStyles.contents16_g1,),
        SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 그리드 열 수
              childAspectRatio: 4/1,
            ),
            itemCount: target.length, //
            itemBuilder: (BuildContext context, int index) {
              MapEntry<String, dynamic> item = target[index];
              // index에 따라 각 아이템을 생성
              return GestureDetector(
                onTap: (){
                  setState(() {
                    if(info.contains(item.key)){
                      info.remove(item.key);
                    }else{
                      if(info.length>=count){
                        info.removeLast();
                      }
                      info.add(item.key);
                    }
                  });
                },
                child: Container(
                  child: Center(child: Text(item.value)),
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: appColorGray8, width: 1),
                        left: BorderSide(color: appColorGray8, width: 1),
                        right: (index % 2 == 1) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                        bottom: (index >= target.length - 2) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                      ),
                      color: info.contains(item.key)?appColorPrimary.withOpacity(0.1):Colors.transparent
                  ),
                ),
              ); //
            },

          ),
        ),
      ],
    );
  }
  Column page4_date_style() {
    List<MapEntry<String, dynamic>> target = statusController.appInfo.dateStyleCodeEntryList!;
    List<String> info = memberInfo1['dateStyleCode']!;
    int count = 6;
    String title= "데이트 스타일은 이래요.";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("(${count}가지 선택 가능)",style: TextStyles.contents16_g1,),
        SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 그리드 열 수
              childAspectRatio: 4/1,
            ),
            itemCount: target.length, //
            itemBuilder: (BuildContext context, int index) {
              MapEntry<String, dynamic> item = target[index];
              // index에 따라 각 아이템을 생성
              return GestureDetector(
                onTap: (){
                  setState(() {
                    if(info.contains(item.key)){
                      info.remove(item.key);
                    }else{
                      if(info.length>=count){
                        info.removeLast();
                      }
                      info.add(item.key);
                    }
                  });
                },
                child: Container(
                  child: Center(child: Text(item.value)),
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: appColorGray8, width: 1),
                        left: BorderSide(color: appColorGray8, width: 1),
                        right: (index % 2 == 1) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                        bottom: (index >= target.length - 2) ? BorderSide(color: appColorGray8, width: 1) : BorderSide.none,
                      ),
                      color: info.contains(item.key)?appColorPrimary.withOpacity(0.1):Colors.transparent
                  ),
                ),
              ); //
            },

          ),
        ),
      ],
    );
  }
  Column page5_mbti() {

    String title= "MBTI를 선택해주세요.";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.title20_b,),
        SizedBox(height: 10,),
        Text("본인의 성격을 나타내는 MBTI를 선택해주세요.",style: TextStyles.contents16_g1,),
        SizedBox(height: 10,),
        Column(
          children: [
            Row(
              children: [
                buildmbti("a","E","외향형"),
                buildmbti("a","I","내향형"),
              ],
            ),
            Row(
              children: [
                buildmbti("b","S","감각형"),
                buildmbti("b","N","직관형"),
              ],
            ),
            Row(
              children: [
                buildmbti("c","T","사고형"),
                buildmbti("c","F","감정형"),
              ],
            ),
            Row(
              children: [
                buildmbti("d","J","판단형"),
                buildmbti("d","P","인식형"),
              ],
            ),

          ],
        )
      ],
    );
  }

  Column page6_success() {
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
  Expanded buildmbti(String key,String value,String name) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 4/1,
        child: GestureDetector(
          onTap: (){
            setState(() {
              mbti[key]=value;
            });
          },
          child: Container(
            child: Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value),
                SizedBox(width: 5,),
                Text("(${name})"),
              ],
            )),
            decoration: BoxDecoration(
              color: mbti[key]==value?appColorPrimary.withOpacity(0.1):Colors.transparent,
              border: Border(
                top: BorderSide(color: appColorGray8, width: 1),
                left: BorderSide(color: appColorGray8, width: 1),
                right: BorderSide(color: appColorGray8, width: 1),
                bottom: BorderSide(color: appColorGray8, width: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
