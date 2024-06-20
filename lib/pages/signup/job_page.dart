import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../component/rectangle_button.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///JobPage
///담당자 : ---

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {

  @override
  void initState() {
    super.initState();
    logger.i("JobPage");
  }
  List<dynamic> _imageList = []; // 직업 인증 자료



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

  List<String> tabList =[
    "전문직",
    "사업가",
    "대기업",
    "공무원",
    "외국계",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "소득"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: tabList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Container(
                      child: Text("전문직"),
                    ),
                  );
                },
              ),
            ),

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
