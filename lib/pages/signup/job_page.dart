import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';
import '../../templete/paper_template.dart';

///JobPage
///담당자 : saran
///설명 : 직업 인증 페이지

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends PaperTemplate<JobPage> {

  @override
  void initState() {
    super.initState();
    logger.i("JobPage");
    //기존 업로드했던 직업 서류 이미지 가져오기
    findImageList("PAPER_JOB");
  }


  List<Map<String,dynamic>> _tabList =[
    {
      "type": "전문직",
      "explain" : "의사, 한의사, 치과의사, 수의사, 약사, 판사, 검사, 변호사, 변리사, 회계사, 세무사, 파일럿, 교수 등",
      "select1" : "본인 명의의 전문직 자격증",
      "select2" : "개인 명함",
      "imageList" : [
        'assets/images/exam/income_1.png',
        'assets/images/exam/income_2.png',
        'assets/images/exam/income_3.png',
      ]
    },
    {
      "type": "사업가",
      "explain" : "연 매출 30억 이상의 개인 사업가 또는 등기임원 ",
      "select1" : "연 매출 30억 이상임을 증빙 할 수 있는 서류",
      "select2" : "사업자 등록증",
      "imageList" : [
        'assets/images/exam/job_3.png',
      ]
    },
    {
      "type": "대기업",
      "explain" : "한국 100대 대기업 및 공기업",
      "select1" : "사원증 or 본인 이름이 나와있는 명함",
      "select2" : "재직증명서 ",
      "imageList" : [
        'assets/images/exam/job_4.png',
        'assets/images/exam/job_5.png',
      ]
    },
    {
      "type": "공무원",
      "explain" : "5급 이상의 공무원",
      "select1" : "공무원 증 ",
      "select2" : null,
      "imageList" : [
        'assets/images/exam/job_6.png',
      ]
    },
    {
      "type": "외국계",
      "explain" : "외국계 글로벌 기업(내규에 따름) ",
      "select1" : "사원증 or 본인 이름이 나와있는 명함",
      "select2" : null,
      "imageList" : [
        'assets/images/exam/job_7.png',
      ]
    },

  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: customAppBar(title: "직업"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            child: Column(
              children: [
                Container(

                  width: Get.width,
                  child:  Row(
                    children: _tabList.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, dynamic> item = entry.value;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                width: _currentIndex == index?2:1,
                                  color: _currentIndex == index?appColorPrimary :appColorGray8,
                              ))
                            ),
                            child: Text(
                              item["type"],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }).toList()),
                ),
                SizedBox(height: 10,),
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
                              Expanded(child: Text(_tabList[_currentIndex]["explain"],style: TextStyles.contents15_b,maxLines: 3,overflow: TextOverflow.ellipsis,))


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
                                    Text(_tabList[_currentIndex]["select1"],style: TextStyles.contents15_b,),

                                  ],
                                ),
                                if(_tabList[_currentIndex]["select2"] != null)
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: appColorPrimary,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                          child: Center(child: Text("선택 2",style: TextStyles.sub_title12_w,)),
                                        ),
                                        SizedBox(width: 8,),
                                        Text(_tabList[_currentIndex]["select2"],style: TextStyles.contents15_b,),

                                      ],
                                    ),
                                  ],
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
                                      children:[
                                        ..._tabList[_currentIndex]["imageList"].map((imageUrl) => Image.asset(imageUrl)).toList()
                                      ]
                                  ),
                                )),
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
                paperSaveButton("PAPER_JOB"),
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
