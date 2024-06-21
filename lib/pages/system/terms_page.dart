import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/pages/system/term_detail_page.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///TermsPage
///담당자 : ---

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {

  @override
  void initState() {
    super.initState();
    logger.i("TermsPage");
  }

  List<String> terms =[
    "서비스 이용약관 동의",
    "개인정보 보호정책 동의",
    "홍보 및 마케팅 이용 동의",
    "광고성 정보 수신 동의",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "이용약관"),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: terms.map((term){
              return GestureDetector(
                onTap: (){
                  Get.to(()=>TermDetailPage(term: term,));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(term,style: TextStyles.sub_title15_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )

                    ],
                  ),
                ),
              );}).toList()
          )),
    );
  }
}



