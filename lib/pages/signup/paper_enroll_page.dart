import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/signup/income_page.dart';
import 'package:pluv/pages/signup/school_page.dart';

import '../../global/global.dart';
import 'car_page.dart';
import 'family_page.dart';
import 'job_page.dart';
import 'money_page.dart';

///PaperEnrollPage
///담당자 : ---

class PaperEnrollPage extends StatefulWidget {
  const PaperEnrollPage({Key? key}) : super(key: key);

  @override
  State<PaperEnrollPage> createState() => _PaperEnrollPageState();
}

class _PaperEnrollPageState extends State<PaperEnrollPage> {

  @override
  void initState() {
    super.initState();
    logger.i("PaperEnrollPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "인증서류 "),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SvgPicture.asset('assets/images/icon/exclamation.svg',width: 12,),
                ),
                SizedBox(width: 5,),
                Text("회원님의 자격에 맞는 인증 뱃지를 만들어주세요.\n이성에게 매력을 표현 할 수 있습니다.(중복가능)",style: TextStyles.contents15_b,)
              ],
            ),
            SizedBox(height: 30,),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 그리드 열 수
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20
                ),
                children: [
                  build_paper_container(
                    function: (){
                      Get.to(()=>IncomePage());
                    },
                    title: "소득(연봉)",
                    subTitle: "20대 최소 6천 이상\n30대 최소 7천 이상",
                    iconPath: 'assets/images/icon/badge_income.svg',
                    active: false
                  ),
                  build_paper_container(
                      function: (){
                        Get.to(()=>JobPage());
                      },
                      title: "직업",
                      subTitle: "전문직/대기업/공무원\n외국계 기업",
                      iconPath: 'assets/images/icon/badge_job.svg',
                      active: false
                  ),
                  build_paper_container(
                      function: (){
                        Get.to(()=>MoneyPage());
                      },
                      title: "자산",
                      subTitle: "부동산/현금/주식/기타 인증",
                      iconPath: 'assets/images/icon/badge_money.svg',
                      active: false
                  ),
                  build_paper_container(
                      function: (){
                        Get.to(()=>CarPage());
                      },
                      title: "차량",
                      subTitle: "1.5억원 이상 상당의\n수입차량 및 슈퍼카\n고급세단 등 차량 소유자",
                      iconPath: 'assets/images/icon/badge_car.svg',
                      active: false
                  ),
                  build_paper_container(
                      function: (){
                        Get.to(()=>FamilyPage());
                      },
                      title: "집안",
                      subTitle: "3급 이상 공무원, 대기업 임원\n명문대 교수, 의료계\n법조계 종사자 등",
                      iconPath: 'assets/images/icon/badge_family.svg',
                      active: false
                  ),
                  build_paper_container(
                      function: (){
                        Get.to(()=>SchoolPage());
                      },
                      title: "학벌",
                      subTitle: "서울대,연세대(서울),고려대(서울),서강대,성균관대,한양대(서울),포스텍",
                      iconPath: 'assets/images/icon/badge_school.svg',
                      active: false
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector build_paper_container({
    required VoidCallback function,
    required String title,
    required String subTitle,
    required String iconPath,
    required bool active,
  }) {
    return GestureDetector(
                  onTap: (){
                    function();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: appColorGray8),
                      color: Color(0xFFFDFDFD),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,style: TextStyles.title16_b,),
                            SizedBox(height: 5,),
                            Text(subTitle,style: TextStyles.sub_title12_g1,),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(iconPath,width: Get.width/7,),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
  }
}
