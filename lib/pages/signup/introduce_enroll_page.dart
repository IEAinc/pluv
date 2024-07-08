import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/custom_input_filed.dart';
import '../../component/rectangle_button.dart';
import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///IntroduceEnrollPage
///담당자 : saran
///설명 : 자기소개 등록 페이지

class IntroduceEnrollPage extends StatefulWidget {
  const IntroduceEnrollPage({Key? key}) : super(key: key);

  @override
  State<IntroduceEnrollPage> createState() => _IntroduceEnrollPageState();
}

class _IntroduceEnrollPageState extends State<IntroduceEnrollPage> {

  @override
  void initState() {
    super.initState();
    logger.i("IntroduceEnrollPage");
    //이전 등록했던 정보가 있으면 가져옴
    selfIntroduce = prefs.getString('tmp_selfIntroduce')??"";
    selfIntroduceController = TextEditingController(text: selfIntroduce);
  }

  String selfIntroduce ="";
  AuthController authController = Get.find<AuthController>();
  TextEditingController selfIntroduceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(title: "자기소개"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("자기소개 글을 작성해주세요.",style: TextStyles.title20_b,),
                SizedBox(height: 10,),
                Text("자기소개가 자세 할수록 매칭 성공률이 상승합니다.",style: TextStyles.contents14_g1,),
                Text("당신의 매력을 글로 어필해주세요!",style: TextStyles.contents14_g1,),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: appColorGray8),
                    color: Color(0xFFf9f9f9)
                  ),
                  child: Column(
                    children: [
                      CustomInputFiled(

                        labelText: "자기 소개 작성해주세요",

                        controller: selfIntroduceController,
                        fillColor: Color(0xFFf9f9f9),
                        keyboardType: TextInputType.multiline,
                        borderRadius: 1,
                        contentsPaddingVertical: 1,
                        contentsPaddingHorizontal: 1,
                        maxLine: 15,
                        minLines: 10,
                        isDense: true,
                        onChanged: (val) {
                          setState(() {
                            selfIntroduce = val;
                          });
                        },
                        suffix: false,
                      ),
                      SizedBox(height: 20,),
                      Text("* 개인 연락처/SNS 계정등을 남길 경우 별도 경고 없이 정지 처분될 수 있습니다.",style: TextStyles.contents14_b,)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
               
                RectangleButton(name: "저장",mode: 1,action: () async{
                  await prefs.setString('tmp_selfIntroduce', selfIntroduce);

                  authController.myInfo!.selfIntroduce = selfIntroduce;
                  authController.myInfo!.profileStatus!.step5 = true;
                  await authController.updateMember();
                  Get.back();

                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
