import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/signup/paper_enroll_page.dart';

import '../../global/global.dart';

///MyScreenType2
///담당자 : ---

class MyScreenType2 extends StatefulWidget {
  const MyScreenType2({Key? key}) : super(key: key);

  @override
  State<MyScreenType2> createState() => _MyScreenType2State();
}

class _MyScreenType2State extends State<MyScreenType2> {

  @override
  void initState() {
    super.initState();
    logger.i("MyScreenType2");
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text("심사 신청 완료!\n관리자가 승인 중에 있습니다.",style: TextStyles.title24_b,textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Text("안전하고 믿을 수 있는 만남을 위해\n서류 심사까지 1~2일 정도의 시간이 소요됩니다.\n승인 즉시 앱 알림을 통해 알려드립니다.",style: TextStyles.contents16_g1,textAlign: TextAlign.center,),
          SizedBox(height: 120,),
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
                Expanded(child: Text("심사 과정에서 승인 반려가 될 수 있다는 점 미리 양해 부탁드립니다.",style: TextStyles.contents15_b,))


              ],
            ),
          ),
          SizedBox(height: 20,),
          RectangleButton(name: "서류 추가하기", mode: 1,action: (){
            Get.to(PaperEnrollPage());
          },)
        ],
      ),
    );
  }
}
