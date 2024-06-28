import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/avatar_image.dart';
import 'package:pluv/component/basic_botton.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/my/block_page.dart';
import 'package:pluv/pages/my/invite_friend_page.dart';
import 'package:pluv/pages/my/profile_edit_page.dart';
import 'package:pluv/pages/my/profile_picture_page.dart';
import 'package:pluv/pages/signup/introduce_enroll_page.dart';
import 'package:pluv/pages/signup/profile_info_page.dart';
import 'package:pluv/pages/start/login_page.dart';
import 'package:pluv/pages/system/setting_page.dart';

import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../my/my_point_page.dart';
import '../signup/basic_info_page.dart';
import '../signup/picture_enroll_page.dart';
import 'my_screen_type1.dart';
import 'my_screen_type2.dart';
import 'my_screen_type3.dart';

///MyScreen
///담당자 : ---

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    logger.i("MyScreen");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<AuthController>(
        builder: (authController) {
          return authController.myInfo==null?Center(child: GestureDetector(
              onTap: (){
                Get.to(()=>LoginPage());
              },
              child: Text("로그인 하러가기"))): SingleChildScrollView(
            child: Column(
              children: [

                if(authController.myInfo!.memberStatus==1)
                  //비승인 회원

                  MyScreenType1(),
                  if(authController.myInfo!.memberStatus==2)
                    //심사중회원
                    MyScreenType2(),
                    if(authController.myInfo!.memberStatus==3)
                //승인회원
                      MyScreenType3(),

              ],
            ),
          );
        }
      ),
    );
  }
}
