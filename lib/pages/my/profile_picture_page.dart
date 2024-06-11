import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///ProfilePicturePage
///담당자 : ---

class ProfilePicturePage extends StatefulWidget {
  const ProfilePicturePage({Key? key}) : super(key: key);

  @override
  State<ProfilePicturePage> createState() => _ProfilePicturePageState();
}

class _ProfilePicturePageState extends State<ProfilePicturePage> {

  @override
  void initState() {
    super.initState();
    logger.i("ProfilePicturePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "프로필사진"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Column(
        
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("프로필 사진 수정",style: TextStyles.title24_b,),
                  SizedBox(height: 20,),
                  Text("마스크, 선글라스등 얼굴을 가린 사진은 피해주세요.",style: TextStyles.sub_title16_g1,),
                  Row(
                    children: [
                      Text("최근과 가장 비슷한 현재의 모습",style: TextStyles.sub_title16_b.copyWith(color: appColorPrimary),),
                      Text("으로 올려주세요!",style: TextStyles.sub_title16_g1,),
                    ],
                  ),
                  Text("이미 당신은 충분히 아름답고 멋있습니다.",style: TextStyles.sub_title16_g1,),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  AspectRatio(
                      aspectRatio: 1,
                      child: Container(width: Get.width,color: Colors.red,)),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: (Get.width-40-32)/5,
                        width: (Get.width-40-32)/5,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: (Get.width-40-32)/5,
                        width: (Get.width-40-32)/5,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: (Get.width-40-32)/5,
                        width: (Get.width-40-32)/5,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: (Get.width-40-32)/5,
                        width: (Get.width-40-32)/5,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: (Get.width-40-32)/5,
                        width: (Get.width-40-32)/5,
                        color: Colors.blue,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              RectangleButton(name: "저장")
        
            ],
          ),
        ),
      ),
    );
  }
}
