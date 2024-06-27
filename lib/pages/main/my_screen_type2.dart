import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/avatar_image.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/model/vo/admin_vo.dart';
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
    getAdmin();
  }

  AdminVo? myAdmin;
  void getAdmin() async{

    try{
      myAdmin = await authController.getMyAdmin();
      setState(() {});
    }catch(e){
      logger.e(e);
    }
  }

  AuthController authController = Get.find<AuthController>();
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
          SizedBox(height: 20,),

          if(myAdmin==null)
          Column(
            children: [
              AvatarImage(),
              SizedBox(height: 10,),
              Text("회원님에게 배치된 담당자가 아직없어요"),
            ],
          ),
          if(myAdmin!=null)
          Column(
            children: [
              AvatarImage(imagePath: myAdmin!.adminThumbnail!,),
              SizedBox(height: 10,),
              Text("담당관리자 : ${myAdmin!.adminNickName!}"),
              Text("이메일 : ${myAdmin!.adminEmail!}"),

            ],
          ),

          SizedBox(height: 20,),
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
          },),
          GestureDetector(
            onTap: (){
              authController.logout();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("로그아웃",style: TextStyles.sub_title15_b,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
