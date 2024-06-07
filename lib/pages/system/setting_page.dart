import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///SettingPage
///담당자 : ---

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  void initState() {
    super.initState();
    logger.i("SettingPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "설정"),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("알람설정",style: TextStyles.sub_title15_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("이메일 변경",style: TextStyles.sub_title15_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("비밀번호 변경",style: TextStyles.sub_title15_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("계정 휴면 신청",style: TextStyles.sub_title15_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("로그아웃",style: TextStyles.sub_title15_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )

                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
