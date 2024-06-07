import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';
import 'my_invite_history.dart';

///InviteFriendPage
///담당자 : ---

class InviteFriendPage extends StatefulWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  State<InviteFriendPage> createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {

  @override
  void initState() {
    super.initState();
    logger.i("InviteFriendPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(title: "친구 초대"),
      body: Column(
        children: [
          Image.asset('assets/images/invite.png'),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("내 초대 코드",style: TextStyles.title18_b,),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: appColorPrimary.withOpacity(0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("친구를 초대할 때마다 해당 회원님과 함께",style: TextStyles.sub_title15_g1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("무료 포인트 5개",style: TextStyles.sub_title15_g1.copyWith(color: appColorPrimary)),
                              Text("를 적립해드립니다.",style: TextStyles.sub_title15_g1,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(

                        decoration: BoxDecoration(
                          color: appColorWhite,
                          border: Border.all(width: 0.5 , color: appColorGray2)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text("초대코드",style: TextStyles.sub_title15_g1,)
                            ),
                            Expanded(
                                flex: 1,
                                child: Center(child: Text("DD5297",style: TextStyles.sub_title15_b,))),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.copy,size: 15,color: appColorPrimary,),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          overlayColor: appColorPrimary,
                          backgroundColor: Colors.yellow,
                          side: BorderSide(color: appColorGray6, width: 0.5), // 테두리 색상
                          fixedSize: Size(Get.width,52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon/kakao.png'),
                            SizedBox(width: 10,),
                            Text("친구에게 추천인코드 공유하기",style: TextStyles.sub_title15_b,),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MyInviteHistory());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("내가 초대한 내역",style: TextStyles.title18_b,),
                      Transform.rotate(
                        angle: 180 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                        child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
