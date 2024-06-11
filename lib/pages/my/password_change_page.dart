import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../component/custom_input_filed.dart';
import '../../component/rectangle_button.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///PasswordChangePage
///담당자 : ---

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({Key? key}) : super(key: key);

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {

  @override
  void initState() {
    super.initState();
    logger.i("PasswordChangePage");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: customAppBar(title: "비밀번호 변경"),
            body: SingleChildScrollView(
              child: Container(
                height: 1000,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("현재 비밀번호",style: TextStyles.sub_title15_b,),
                        CustomInputFiled(

                          // controller: commentController,
                          fillColor: Color(0xFFf9f9f9),
                          borderRadius: 5,
                          contentsPaddingVertical: 10,
                          isDense: true,
                          onChanged: (val) {
                            setState(() {

                            });
                          },
                          suffix: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("새 비밀번호",style: TextStyles.sub_title15_b,),
                        CustomInputFiled(

                          // controller: commentController,
                          fillColor: Color(0xFFf9f9f9),
                          borderRadius: 5,
                          contentsPaddingVertical: 10,
                          isDense: true,
                          onChanged: (val) {
                            setState(() {

                            });
                          },
                          suffix: true,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/icon/caution.svg',width: 12,colorFilter: ColorFilter.mode(appColorGray1, BlendMode.srcIn)),
                            SizedBox(width: 3,),
                            Expanded(child: Text("영문/숫자/특수문자 중 2가지 이상 조합하여 8-20자로 입력해 주세요.",maxLines: 2,style: TextStyles.contents12_g1.copyWith(height: 1),)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("새 비밀번호 확인",style: TextStyles.sub_title15_b,),
                        CustomInputFiled(

                          // controller: commentController,
                          fillColor: Color(0xFFf9f9f9),
                          borderRadius: 5,
                          contentsPaddingVertical: 10,
                          isDense: true,
                          onChanged: (val) {
                            setState(() {

                            });
                          },
                          suffix: true,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            child: SizedBox(
                width: Get.width-32,
                child: RectangleButton(name: "저장")),
          ),
        ],
      ),
    );
  }
}
