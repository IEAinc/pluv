import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/start/login_page.dart';

import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';
import '../signup/sign_up_condition_page.dart';

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
    prefs.setBool('onBoarding', true);

  }

  StatusController statusController = Get.find<StatusController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.to(()=>LoginPage());
                    },
                    child: Text("SKIP",style: TextStyles.contents14_b,))
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: PageView.builder(

                itemCount: statusController.appInfo.onboardingInfoList?.length??0,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Text("${statusController.appInfo.onboardingInfoList![index].title}",style: TextStyles.sub_title18_b,),
                        SizedBox(height: 10,),
                        Text("${statusController.appInfo.onboardingInfoList![index].subTitle!.replaceAll("\\n", "\n")}",style: TextStyles.title24_b,textAlign: TextAlign.center,),
                        SizedBox(height: 40,),
                        ExtendedImage.network(
                          statusController.appInfo.onboardingInfoList![index].url??"",
                          cache: true,
                          fit: BoxFit.cover,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return CustomProgressIndicator();
                              case LoadState.completed:
                                return state.completedWidget;
                              case LoadState.failed:
                                return Icon(Icons.error);
                            }
                          },
                        )
                    
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(child: RectangleButton(
                    name: "로그인",
                  mode: 1,
                  backgroundColor: appColorGray8,
                  textStyle: TextStyles.sub_title16_b,
                  action: (){
                      Get.to(()=>LoginPage());
                  },
                )),
                SizedBox(width: 10,),
                Expanded(child: RectangleButton(name: "가입하기",mode: 1,action: (){
                  Get.to(()=>SignUpConditionPage());
                },)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
