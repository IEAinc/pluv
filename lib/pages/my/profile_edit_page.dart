import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/custom_divider.dart';
import 'package:pluv/component/dot.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/controller/data_controller.dart';
import 'package:pluv/global/text_styles.dart';

import '../../component/common_tag.dart';
import '../../controller/status_controller.dart';
import '../../global/global.dart';

///ProfileEditPage
///담당자 : ---

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {

  @override
  void initState() {
    super.initState();
    logger.i("ProfileEditPage");
  }

  StatusController _statusController = Get.find<StatusController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: Get.width*312/375,

                floating: false,
                pinned: true,
                leading: IconButton(onPressed: (){
                  Get.back();
                },icon: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 16,height: 16,),),
                flexibleSpace: FlexibleSpaceBar(

                  background: ExtendedImage.network(
                    authController.myInfo?.profileImageList?[0]??"",
                    width: Get.width,
                    height: Get.width*312/375,
                    fit: BoxFit.cover,
                    cache: true,
                    loadStateChanged: (ExtendedImageState state) {
                      if (state.extendedImageLoadState == LoadState.failed) {
                        return Image.asset(
                          logoPath,
                          fit: BoxFit.cover,
                          width: Get.width,
                          height: Get.width*312/375,
                        );
                      }
                    },
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Column(
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(_statusController.findTitleByCode(_statusController.appInfo.areaCode!,authController.myInfo!.areaCode!),style: TextStyles.contents14_g1,),
                                      Dot(),
                                      Text("${calculateAge(authController.myInfo!.memberBirth!)}세",style: TextStyles.contents14_g1,),
                                    ],
                                  ),
                                  Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                                ],
                              ),

                              Text(authController.myInfo!.nickName!,style: TextStyles.title20_b,),
                            ],
                          ),
                        ),
                        CustomDivider(),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("스펙인증"),
                                  Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                                ],
                              ),

                              Text(authController.myInfo!.nickName!,style: TextStyles.title20_b,),
                            ],
                          ),
                        ),
                        CustomDivider(),
                        buildInfoCard("직업/직장",authController.myInfo!.memberJob),
                        buildInfoCard("지역",_statusController.findTitleByCode(_statusController.appInfo.areaCode!,authController.myInfo!.areaCode!)),
                        buildInfoCard("키","${authController.myInfo!.memberHeight}"),
                        buildInfoCard("나이","${calculateAge(authController.myInfo!.memberBirth!)}"),
                        buildInfoCard("체형",_statusController.findTitleByCode(_statusController.appInfo.bodyFormCode!,authController.myInfo!.bodyFormCode!)),
                        buildInfoCard("음주",_statusController.findTitleByCode(_statusController.appInfo.drinkCode!,authController.myInfo!.drinkCode!)),
                        buildInfoCard("흡연","${authController.myInfo!.smoke==true?"흡연":"비흡연"}"),
                        buildInfoCard("종교",_statusController.findTitleByCode(_statusController.appInfo.religionCode!,authController.myInfo!.religionCode!)),
                        buildInfoCard("성격",_statusController.findTitleListByCode(_statusController.appInfo.personalityCode!,authController.myInfo!.personalityCode!).join(',')),
                        buildInfoCard("MBTI","${authController.myInfo!.mbti!["a"]}${authController.myInfo!.mbti!["b"]}${authController.myInfo!.mbti!["c"]}${authController.myInfo!.mbti!["d"]}"),
                        CustomDivider(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("자기소개",style: TextStyles.sub_title15_g1,),
                                  Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                                ],
                              ),

                              SizedBox(height: 16,),
                              Text(authController.myInfo!.selfIntroduce!,style: TextStyles.contents15_b,),
                            ],
                          ),
                        ),
                        CustomDivider(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("저는 이런분야에 관심있어요",style: TextStyles.sub_title15_g1,),
                                  Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                                ],
                              ),

                              SizedBox(height: 16,),
                              Wrap(
                                spacing: 8.0, // 수평 간격
                                runSpacing: 5.0, // 수직 간격
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                children: authController.myInfo!.interestCode!.map((
                                    item) => IntrinsicWidth(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),

                                      decoration: BoxDecoration(
                                          color: Color(0xFFd3c8ff).withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(2)
                                      ),

                                      child: Text(_statusController.findTitleByCode(_statusController.appInfo.interestCode!,item),style: TextStyles.contents13_b,),
                                    ))).toList(),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("저의 매력포인트는 이런 것들이에요",style: TextStyles.sub_title15_g1,),
                                  Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                                ],
                              ),

                              SizedBox(height: 16,),
                              Wrap(
                                spacing: 8.0, // 수평 간격
                                runSpacing: 5.0, // 수직 간격
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                children: authController.myInfo!.attractionCode!.map((
                                    item) => IntrinsicWidth(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                                      
                                      decoration: BoxDecoration(
                                        color: Color(0xFFd3c8ff).withOpacity(0.25),
                                        borderRadius: BorderRadius.circular(2)
                                      ),

                                      child: Text(_statusController.findTitleByCode(_statusController.appInfo.attractionCode!,item),style: TextStyles.contents13_b,),
                                    ))).toList(),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("저는 이런 데이트가 좋아요",style: TextStyles.sub_title15_g1,),
                                  Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                                ],
                              ),

                              SizedBox(height: 16,),
                              Wrap(
                                spacing: 8.0, // 수평 간격
                                runSpacing: 5.0, // 수직 간격
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                children: authController.myInfo!.dateStyleCode!.map((
                                    item) => IntrinsicWidth(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),

                                      decoration: BoxDecoration(
                                          color: Color(0xFFd3c8ff).withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(2)
                                      ),

                                      child: Text(_statusController.findTitleByCode(_statusController.appInfo.dateStyleCode!,item),style: TextStyles.contents13_b,),
                                    ))).toList(),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:50,),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Container buildInfoCard(title,contents) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFf5f5f5)))
      ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(title)),
                            Expanded(
                                flex: 2,
                                child: Text(contents,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                            Text("수정",style: TextStyles.contents12_g1.copyWith(decoration: TextDecoration.underline),),
                          ],
                        ),
                      );
  }



}



