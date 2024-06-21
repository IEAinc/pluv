import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/pages/system/notice_page.dart';
import 'package:pluv/pages/system/terms_page.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///CustomerCenterPage
///담당자 : ---

class CustomerCenterPage extends StatefulWidget {
  const CustomerCenterPage({Key? key}) : super(key: key);

  @override
  State<CustomerCenterPage> createState() => _CustomerCenterPageState();
}

class _CustomerCenterPageState extends State<CustomerCenterPage> {

  @override
  void initState() {
    super.initState();
    logger.i("CustomerCenterPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "고객센터"),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){

                  Get.to(()=>NoticePage(type: "notice",));

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("공지사항",style: TextStyles.sub_title15_b,),
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
                  Get.to(()=>NoticePage(type: "faq",));

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("자주 묻는 질문",style: TextStyles.sub_title15_b,),
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
                      Text("1:1문의  ",style: TextStyles.sub_title15_b,),
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
                  Get.to(()=>TermsPage());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("이용약관",style: TextStyles.sub_title15_b,),
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
                      Text("사업자 정보",style: TextStyles.sub_title15_b,),
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
