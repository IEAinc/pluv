import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/start/login_page.dart';

import '../../global/global.dart';

///OnboardingPage
///담당자 : ---

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  @override
  void initState() {
    super.initState();
    logger.i("OnboardingPage");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("SKIP",style: TextStyles.contents14_b,)
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: PageView(

                  children: <Widget>[

                    Center(child: Text("능력 집안 커리어")),
                    Center(child: Text("까다롭")),
                    Center(child: Text("지금바로 ㄱㄱ")),


                  ],
                  onPageChanged: (index) {
                    setState(() {
                      // _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(child: RectangleButton(
                      name: "로그인",
                    action: (){
                        Get.to(()=>LoginPage());
                    },
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: RectangleButton(name: "가입하기")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
