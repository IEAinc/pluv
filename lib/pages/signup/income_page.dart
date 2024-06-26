import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluv/component/rectangle_button.dart';

import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';
import '../../templete/paper_template.dart';

///IncomePage
///담당자 : ---

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends PaperTemplate<IncomePage> {

  @override
  void initState() {
    super.initState();
    logger.i("IncomePage");
    findImageList("PAPER_INCOME");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: customAppBar(title: "소득"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: appColorPrimary.withOpacity(0.03),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SvgPicture.asset('assets/images/icon/exclamation.svg',width: 12,),
                              ),
                              SizedBox(width: 5,),
                              Text("30대 최소 7천 만원 이상\n20대 최소 6천만원 이상의 고소득자",style: TextStyles.contents15_b,)


                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("인증방법",style: TextStyles.title16_b,),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: appColorPrimary,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                      child: Center(child: Text("선택 1",style: TextStyles.sub_title12_w,)),
                                    ),
                                    SizedBox(width: 8,),
                                    Text("고소득 직장인일 경우",style: TextStyles.contents15_b,),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  color: Color(0xFFf9f9f9),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("필수 1",style: TextStyles.sub_title15_b),
                                          SizedBox(width: 10),
                                          Text("원천징수 영수증",style: TextStyles.sub_title15_g1),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text("필수 2",style: TextStyles.sub_title15_b),
                                          SizedBox(width: 10),
                                          Text("연봉계약서",style: TextStyles.sub_title15_g1),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),

                            SizedBox(height: 10,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: appColorPrimary,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                      child: Center(child: Text("선택 1",style: TextStyles.sub_title12_w,)),
                                    ),
                                    SizedBox(width: 8,),
                                    Text("개인 사업자, 자영업의 경우",style: TextStyles.contents15_b,),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  color: Color(0xFFf9f9f9),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("필수 1",style: TextStyles.sub_title15_b),
                                          SizedBox(width: 10),
                                          Text("소득금액 증명원",style: TextStyles.sub_title15_g1),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("인증예시",style: TextStyles.title16_b,),
                                SizedBox(width: 10,),
                                Text("모든 인증 자료는 확인 용도로만 사용 됩니다.",style: TextStyles.sub_title13_g1,),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Stack(
                              children: [
                                Container(

                                  height: moreToggle?null:100,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/images/exam/income_1.png',),
                                        Image.asset('assets/images/exam/income_2.png',),
                                        Image.asset('assets/images/exam/income_3.png',),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          moreToggle = !moreToggle;
                                        });
                                      },
                                      child: Container(
                                        color: appColorPrimary.withOpacity(0.2),
                                        height: 30,
                                        width: Get.width-32,
                                        child: Center(child: Text(moreToggle?"닫기":"더보기",style: TextStyles.sub_title12_b,)),
                                      ),
                                    ))
                              ],
                            )



                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("인증 확인용 자료 업로드",style: TextStyles.title16_b,),

                            SizedBox(height: 10,),
                            Row(
                              children: [
                                picture_box(0),
                                SizedBox(width: 10,),
                                picture_box(1),
                                SizedBox(width: 10,),
                                picture_box(2),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("모든 인증 자료는 확인 용도로만 사용되며 상대에게 세부 사항은 공개되지 않습니다. 상대에게 뱃지 보유 여부만 표시합니다.",style: TextStyles.sub_title13_g1,),


                          ],
                        ),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                paperSaveButton("PAPER_INCOME"),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
        if(loading)
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white.withOpacity(0.5),
            child: Center(child: CustomProgressIndicator()),
          )
      ],
    );
  }


}

