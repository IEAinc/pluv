import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/avatar_image.dart';
import 'package:pluv/component/basic_botton.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///MyScreen
///담당자 : ---

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

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
      child: SingleChildScrollView(
        child: Container(
          child: Column(
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
                                onPressed: (){},
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
                    RectangleButton(name: "프로필 수정"),
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
                  Container(

                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/icon/envelope_icon.svg',width: 20,),
                        SizedBox(width: 10,),
                        Text("초대 코드",style: TextStyles.sub_title15_b,)
                      ],
                    ),
                  ),

                ],
              ),
              Divider(thickness: 6,color: appColorGray8,height: 40,),
              Container(

                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Row(
                  children: [

                    Text("설정",style: TextStyles.sub_title15_b,)
                  ],
                ),
              ),
              Container(

                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Row(
                  children: [

                    Text("고객센터",style: TextStyles.sub_title15_b,)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
