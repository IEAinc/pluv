
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';
import '../../templete/paper_template.dart';

///SchoolPage
///담당자 : saran
///설명 : 학교 인증 페이지

class SchoolPage extends StatefulWidget {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends PaperTemplate<SchoolPage> {

  @override
  void initState() {
    super.initState();
    logger.i("SchoolPage");
    //기존에 올려둔 학교 인증서류 이미지 불러오기
    findImageList("PAPER_SCHOOL");
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: customAppBar(title: "학벌"),
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
                              Text("서울대, 연세대(서울), 고려대(서울), 서강대\n성균관대, 한양대(서울), 포스텍, 카이스트\n로스쿨, 경찰대, 사관학교, UNIST, DGIST,GIST\n의대/치대/한의대/약대 등\n국내 명문대학교 또는 명문대학 졸업/재학생",style: TextStyles.contents15_b,)


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
                                    Text("재학증명서",style: TextStyles.contents15_b,),

                                  ],
                                ),
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
                                    Text("졸업증명서",style: TextStyles.contents15_b,),

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
                                      children: [
                                        Image.asset('assets/images/exam/edu_1.png',),
                                        Image.asset('assets/images/exam/edu_2.png',),
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
                paperSaveButton("PAPER_SCHOOL"),
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

