import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluv/component/rectangle_button.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///CarPage
///담당자 : ---

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {

  @override
  void initState() {
    super.initState();
    logger.i("CarPage");
  }

  List<dynamic> _imageList = []; // 소득 인증 자료



  Future<void> _addImage() async {
    XFile? file = await pickImage();
    if(_imageList.length<5){
      if (file != null) {
        setState(() {
          _imageList.add(File(file.path));
        });
      }
    }
  }

  Future<void> _editImage(int index) async {

    XFile? file = await pickImage();
    if (file != null) {
      setState(() {
        _imageList[index] = File(file.path);
      });
    }



  }

  bool moreToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "차량 "),
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
                          Expanded(child: Text("1.5억원 이상 상당의 수입차량, 스포츠카, 고급세단 슈퍼카 등의 차량 소지자",style: TextStyles.contents15_b,))


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
                                Text("본인차량 인증",style: TextStyles.contents15_b,),

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
                                      Text("본인 성명이 기재된 자동차 등록증",style: TextStyles.sub_title15_g1),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("필수 2",style: TextStyles.sub_title15_b),
                                      SizedBox(width: 10),
                                      Text("장기렌트 또는 리스 계약서",style: TextStyles.sub_title15_g1),
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
                                Text("리스/장기렌트 차량의 경우",style: TextStyles.contents15_b,),

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
                                      Text("장기렌트 또는 리스 계약서",style: TextStyles.sub_title15_g1),
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
                                    Image.asset('assets/images/exam/car_1.png',),
                                    Image.asset('assets/images/exam/car_2.png',),
                                    Image.asset('assets/images/exam/car_3.png',),
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
                            _picture_box(0),
                            SizedBox(width: 10,),
                            _picture_box(1),
                            SizedBox(width: 10,),
                            _picture_box(2),

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
            RectangleButton(name:"저장",mode: 1,),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Container _picture_box(int index) {
    return Container(
      height: (Get.width-20-32)/3,
      width: (Get.width-20-32)/3,
      decoration: BoxDecoration(
          border: Border.all(color: appColorGray8)
      ),

      child:  (_imageList!.length <= index )?GestureDetector(
          onTap: (){
            _addImage();
          },
          child: Container(
              color: Colors.transparent,
              child: Center(child: Text("+",style: TextStyles.contents24_g1,))))
          :GestureDetector(
          onTap: (){
            _editImage(index);
          },
          child: (_imageList[index] is String)?Image.network(_imageList[index],fit: BoxFit.cover,):Image.file(_imageList[index],fit: BoxFit.cover,)),
    );
  }
}
