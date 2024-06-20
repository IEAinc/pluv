import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/rectangle_button.dart';
import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';
import '../signup/basic_info_page.dart';
import '../signup/introduce_enroll_page.dart';
import '../signup/paper_enroll_page.dart';
import '../signup/picture_enroll_page.dart';
import '../signup/profile_info_page.dart';

///MyScreenType1
///담당자 : ---

class MyScreenType1 extends StatefulWidget {
  const MyScreenType1({Key? key}) : super(key: key);

  @override
  State<MyScreenType1> createState() => _MyScreenType1State();
}

class _MyScreenType1State extends State<MyScreenType1> {

  @override
  void initState() {
    super.initState();
    logger.i("MyScreenType1");
  }


  // AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("반갑습니다 김민규"),
              SizedBox(height: 20,),
              Text("기본정보및 프로필입력을 완성하시고 관리자에게 승인을 요청해주세요"),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    Get.to(()=>BasicInfoPage());
                  },
                  child: Row(
                    children: [
                      Text("*",style: TextStyles.title12_b.copyWith(color: appColorRed1),),
                      Text("기본정보",style: TextStyles.title17_b,),
                      SizedBox(width: 10,),
                      if(authController!.myInfo!.profileStatus!.step1!)
                      Icon(Icons.check,color: Colors.green,size: 20,)
                    ],
                  )),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    Get.to(()=>ProfileInfoPage());
                  },
                  child: Row(
                    children: [
                      Text("*",style: TextStyles.title12_b.copyWith(color: appColorRed1),),
                      Text("프로필",style: TextStyles.title17_b,),
                      if(authController!.myInfo!.profileStatus!.step2!)
                        Icon(Icons.check,color: Colors.green,size: 20,)
                    ],
                  )),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    Get.to(()=>PictureEnrollPage());
                  },
                  child: Row(
                    children: [
                      Text("*",style: TextStyles.title12_b.copyWith(color: appColorRed1),),
                      Text("사진등록",style: TextStyles.title17_b,),
                      if(authController!.myInfo!.profileStatus!.step3!)
                        Icon(Icons.check,color: Colors.green,size: 20,)
                    ],
                  )),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.to(()=>PaperEnrollPage());
                },
                child: Row(
                  children: [
                    Text("*",style: TextStyles.title12_b.copyWith(color: appColorRed1),),
                    Text("인증서류",style: TextStyles.title17_b,),
                    if(authController!.myInfo!.profileStatus!.step4!)
                      Icon(Icons.check,color: Colors.green,size: 20,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    Get.to(()=>IntroduceEnrollPage());
                  },
                  child: Row(
                    children: [
                      Text("*",style: TextStyles.title12_b.copyWith(color: Colors.transparent),),
                      Text("자기소개등록",style: TextStyles.contents17_b,),
                      if(authController!.myInfo!.profileStatus!.step5!)
                        Icon(Icons.check,color: Colors.green,size: 20,)
                    ],
                  )),
              SizedBox(height: 50,),
              RectangleButton(
                name: "심사신청하기",
                mode: 1,
                action: (){
                  logger.e(authController.myInfo!.toJson());
                },
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  authController.logout();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("로그아웃",style: TextStyles.sub_title15_b,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
