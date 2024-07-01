import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/signup/sign_up_page.dart';
import 'package:pluv/pages/signup/verification_webview_page.dart';

import '../../global/global.dart';

///IdentityVerificationPage
///담당자 : ---

class IdentityVerificationPage extends StatefulWidget {
  const IdentityVerificationPage({Key? key}) : super(key: key);

  @override
  State<IdentityVerificationPage> createState() => _IdentityVerificationPageState();
}

class _IdentityVerificationPageState extends State<IdentityVerificationPage> {

  @override
  void initState() {
    super.initState();
    logger.i("IdentityVerificationPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "본인인증"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("검증된 만남을 위해\n본인인증이 필요합니다.",style: TextStyles.title20_b,),
                SizedBox(height: 20,),
                Text('프럽(pluv)은 다날(danal) 서비스를 통한 철저한 본인인증을 거치고 있습니다. ',style: TextStyles.contents14_b,),
                SizedBox(height: 20,),
                Text('프럽의 모든 회원은 정확한 실명/정확한 나이/연락처 인증을 거치고 있어 정보도용이 불가하며, ',style: TextStyles.contents14_b,),
                SizedBox(height: 20,),
                Text('단 한명의 유령/알바회원도 존재할 수 없습니다. ',style: TextStyles.contents14_b.copyWith(color: appColorPrimary),),
                SizedBox(height: 20,),
                Container(
                  color: appColorGray8.withOpacity(0.5),
                  padding: EdgeInsets.all(30),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/badge1.png'),
                      Image.asset('assets/images/badge2.png'),
                      Image.asset('assets/images/badge3.png'),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SvgPicture.asset('assets/images/icon/caution.svg',width: 16,height: 16,),
                    SizedBox(width: 3,),
                    Text('안심하세요! 프럽에서 사용되는 모든 정보는\n안전하게 관리됩니다. ',style: TextStyles.contents14_b.copyWith(height: 1),),
                  ],
                ),
            
              ],
            ),
            Column(
              children: [
                RectangleButton(action: (){
                  Get.to(()=>VerificationWebviewPage());
                  // Get.to(()=>SignUpPage());
                },
                  name: "본인인증 하기",
                  mode: 1,

                ),

                SizedBox(height: 30,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
