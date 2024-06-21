import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/pages/system/customer_center_page.dart';

import '../../component/avatar_image.dart';
import '../../component/rectangle_button.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';
import '../my/block_page.dart';
import '../my/invite_friend_page.dart';
import '../my/my_point_page.dart';
import '../my/profile_edit_page.dart';
import '../my/profile_picture_page.dart';
import '../system/setting_page.dart';

///MyScreenType3
///담당자 : ---

class MyScreenType3 extends StatefulWidget {
  const MyScreenType3({Key? key}) : super(key: key);

  @override
  State<MyScreenType3> createState() => _MyScreenType3State();
}

class _MyScreenType3State extends State<MyScreenType3> {

  @override
  void initState() {
    super.initState();
    logger.i("MyScreenType3");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AvatarImage(size: 92,),

                  Positioned(
                    right: -5,
                    bottom: 7,
                    child: SizedBox(
                      width: 26,
                      height: 26,
                      child: FloatingActionButton(
                        onPressed: (){
                          Get.to(()=>ProfilePicturePage());
                        },
                        backgroundColor: appColorWhite,
                        child: Icon(Icons.camera_alt,size: 15,)
                        ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100), // 모서리를 직각으로 설정
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("주지훈입니다",style: TextStyles.title18_b,),
              Text("현대차 연구원",style: TextStyles.contents15_b,),
              SizedBox(height: 20,),
              RectangleButton(name: "프로필 수정",action: (){
                Get.to(()=>ProfileEditPage());
              },),
            ],
          ),
        ),
        Divider(thickness: 6,color: appColorGray8,height: 40,),
        Column(
          children: [
            Container(

              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/icon/badge_icon.svg',width: 20,),
                  SizedBox(width: 10,),
                  Text("뱃지 인증",style: TextStyles.sub_title15_b,)
                ],
              ),
            ),
            Container(

              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/icon/heart_icon_color.svg',width: 20,),
                  SizedBox(width: 10,),
                  Text("이상형 설정",style: TextStyles.sub_title15_b,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>BlockPage());
              },
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Row(
                  children: [
                    Image.asset('assets/images/icon/stop.png',width: 20,),
                    SizedBox(width: 10,),
                    Text("아는 사람 피하기",style: TextStyles.sub_title15_b,)
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Get.to(()=>InviteFriendPage());
              },
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/icon/envelope_icon.svg',width: 20,),
                    SizedBox(width: 10,),
                    Text("친구 초대",style: TextStyles.sub_title15_b,)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>MyPointPage());
              },
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/icon/point_icon.svg',width: 20,),
                    SizedBox(width: 10,),
                    Text("내 포인트",style: TextStyles.sub_title15_b,)
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(thickness: 6,color: appColorGray8,height: 40,),
        GestureDetector(
          onTap: (){
            Get.to(()=>SettingPage());
          },
          child: Container(

            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: Row(
              children: [

                Text("설정",style: TextStyles.sub_title15_b,)
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.to(()=>CustomerCenterPage());
          },
          child: Container(

            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: Row(
              children: [

                Text("고객센터",style: TextStyles.sub_title15_b,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
