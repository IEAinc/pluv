import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';

import '../../component/custom_dialog.dart';
import '../../global/global.dart';
import 'identity_verification_page.dart';

///SignUpConditionPage
///담당자 : ---

class SignUpConditionPage extends StatefulWidget {
  const SignUpConditionPage({Key? key}) : super(key: key);

  @override
  State<SignUpConditionPage> createState() => _SignUpConditionPageState();
}

class _SignUpConditionPageState extends State<SignUpConditionPage> {

  @override
  void initState() {
    super.initState();
    logger.i("SignUpConditionPage");
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Expanded(
              child: PageView(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                          child: Text("남성 가입 조건",style: TextStyles.sub_title12_w,),
                        color: appColorPrimary,
                      ),
                      SizedBox(height: 20,),
                      Text("프럽 남성회원 가입조건",style: TextStyles.title20_b,),
                      SizedBox(height: 20,),
                      Image.asset('assets/images/paper.png'),
                      SizedBox(height: 20,),
                      Text("전문직, 자산가, 사업가, 국내외 명문대 재학 및\n졸업생 및 경제력 혹은 사회적\n지위를 갖춘 남성",style: TextStyles.contents16_b,textAlign: TextAlign.center,)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        child: Text("여성 가입 조건",style: TextStyles.sub_title12_w,),
                        color: appColorPrimary,
                      ),
                      SizedBox(height: 20,),
                      Text("프럽 여성회원 가입조건",style: TextStyles.title20_b,),
                      SizedBox(height: 20,),

                      Image.asset('assets/images/woman.png'),

                      SizedBox(height: 20,),
                      Text("기존 프럽 회원의 프로필 평가에서 매력\n점수 3점 이상을 받으신 분",style: TextStyles.contents16_b,textAlign: TextAlign.center,),
                      SizedBox(height: 10,),
                      Text("OR",style: TextStyles.contents16_b.copyWith(color: appColorPrimary),),
                      SizedBox(height: 10,),
                      Text("전문직, 자산가, 사업가, 국내외 명문대 재학 및\n졸업생 및 경제력 혹은 사회적\n지위를 갖춘 여성",style: TextStyles.contents16_b,textAlign: TextAlign.center,)
                    ],
                  ),
                ],
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex= index;
                  });

                },
              ),
            ),
            PageViewDotIndicator(
              currentItem: _currentIndex,
              count: 2,
              unselectedColor: appColorGray1,
              selectedColor: appColorPrimary,
            ),
            SizedBox(height: 50,),
            RectangleButton(
              action: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: 20,),
                        Text("잠깐! 법적 싱글이신가요?",style: TextStyles.title22_b,),
                        SizedBox(height: 20,),
                        Image.asset('assets/images/shield.png',width: 70,),
                        SizedBox(height: 20,),
                        Text("기혼자는 가입이 엄격히 금지됩니다.\n프로톡은 법적으로 싱글인 사람만 가입 가능하며\n이를 위반할 시 관련 법령에 따른",style: TextStyles.sub_title14_b,textAlign: TextAlign.center,),
                        Row(
                          children: [
                            Text("강제탈퇴 및 민/형사상 법적 조치",style: TextStyles.sub_title14_b.copyWith(color: appColorPrimary),textAlign: TextAlign.center,),
                            Text("가 취해질수 있습니다.",style: TextStyles.sub_title14_b,textAlign: TextAlign.center,),

                          ],
                        ),

                        SizedBox(height: 20,),
                        RectangleButton(
                          action: (){
                            Get.back();
                            Get.to(()=> IdentityVerificationPage());
                          },
                          name: "네, 동의합니다.",textStyle: TextStyles.sub_title16_w,backgroundColor: appColorPrimary2,radius: 10,),
                        SizedBox(height: 10,),
                      ],
                    )
                    );
                  },
                );
              },
              name: "다음", radius: 10,backgroundColor: appColorPrimary2,textStyle: TextStyles.sub_title16_w,),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
