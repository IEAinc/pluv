import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/basic_botton.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///MemberProfilePage
///담당자 : ---

class MemberProfilePage extends StatefulWidget {
  const MemberProfilePage({Key? key}) : super(key: key);

  @override
  State<MemberProfilePage> createState() => _MemberProfilePageState();
}

class _MemberProfilePageState extends State<MemberProfilePage> {

  @override
  void initState() {
    super.initState();
    logger.i("MemberProfilePage");
  }

  String sample = "안녕하세요,안녕하세요안녕하세요,안녕하세요안녕하세요,안녕하세요안녕하세요,안녕하세요안녕하세요,안녕하세요안녕하세요,안녕하세요안녕하세요,안녕하세요";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: Get.width,
                      color: Colors.red,
                      child: Image.network('https://thumb.mt.co.kr/06/2023/12/2023120709350055122_1.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Column(
                      children: [
                        Text("경기 35세",style: TextStyles.contents14_g1,),
                        Text("주지훈입니다",style: TextStyles.title20_b,),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/images/icon/star_yellow.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/images/icon/star_yellow.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/images/icon/star_yellow.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/images/icon/star_yellow.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.asset('assets/images/icon/star_yellow.png'),
                            ),

                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(

                                    backgroundColor: appColorPrimary,
                                    overlayColor: appColorWhite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Text("좋아요",style: TextStyles.sub_title15_w,),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(

                                    backgroundColor: appColorPrimary2,
                                    overlayColor: appColorWhite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("매칭 업!",style: TextStyles.sub_title12_w,),
                                      Text("슈퍼좋아요",style: TextStyles.sub_title15_w,),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Divider(thickness: 5,color: appColorGray8,height: 0,),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text("스펙인증"),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Divider(thickness: 5,color: appColorGray8,height: 0,),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),
                        _buildContainer("직업/직장","현대차 연구원"),


                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Divider(thickness: 5,color: appColorGray8,height: 0,),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("자기소개",style: TextStyles.sub_title15_g1,),
                        SizedBox(height: 10,),
                        Text(sample,style: TextStyles.contents15_b,)
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  Divider(thickness: 5,color: appColorGray8,height: 0,),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("저는 이런분야에 관심있어요",style: TextStyles.sub_title15_g1,),
                        SizedBox(height: 10,),
                        Text(sample,style: TextStyles.contents15_b,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("저의 매력포인트는 이런 것들이에요",style: TextStyles.sub_title15_g1,),
                        SizedBox(height: 10,),
                        Text(sample,style: TextStyles.contents15_b,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("저는 이런 데이트가 좋아요",style: TextStyles.sub_title15_g1,),
                        SizedBox(height: 10,),
                        Text(sample,style: TextStyles.contents15_b,)
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),

                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
                color: Colors.white,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 16,height: 16,)),
                    SvgPicture.asset('assets/images/myicon/dot.svg',width: 16,height: 16,)

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildContainer(String title,String contents) {
    return Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(title,style: TextStyles.sub_title15_g1,))),
                        Expanded(
                            flex: 3,
                            child: Container(child: Text(contents,style: TextStyles.contents15_b,))),
                      ],
                    ),
                  );
  }
}

