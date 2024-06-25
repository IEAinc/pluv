import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/custom_progress_indicator.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/model/vo/member_vo.dart';
import 'package:pluv/pages/system/terms_page.dart';


import '../controller/auth_controller.dart';
import '../global/global.dart';
import '../global/text_styles.dart';
import '../pages/main/main_page.dart';
import '../pages/system/term_detail_page.dart';

///SignupBottomSheet
///담당자 : ---

class SignupBottomSheet extends StatefulWidget {
  MemberVo member;
  SignupBottomSheet({Key? key ,required this.member}) : super(key: key);

  @override
  State<SignupBottomSheet> createState() => _SignupBottomSheetState();
}

class _SignupBottomSheetState extends State<SignupBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("SignupBottomSheet");
  }

  bool isAllChecked =false;

  Map<String,bool> checkList= {

    "isServiceChecked" : false,
    "isPolicyChecked" : false,
    "isMarketingChecked" : false,
    "isAdChecked" : false,
  };


  void _updateCheckEntire() {
    setState(() {
      isAllChecked = checkList.values.every((value) => value == true);
    });
  }

  void _toggleCheckEntire() {
    setState(() {
      if (!isAllChecked) {
        checkList.updateAll((key, value) => true);
        isAllChecked = true;
      } else {
        checkList.updateAll((key, value) => false);
        isAllChecked = false;
      }
    });
  }



  OverlayEntry? _overlayEntry;

  void _showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: GestureDetector(
          onTap: _hideOverlay,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: CustomProgressIndicator(),
          ),
        ),
      ),
    );
  }

  AuthController authController = Get.find<AuthController>();
  StatusController statusController = Get.find<StatusController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: Get.height/2,
            width: Get.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: appColorWhite
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("약관에 동의해주세요.",style:TextStyles.title18_b ,),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    activeColor: appColorPrimary,
                                    checkColor: appColorWhite,
                                    side: BorderSide(width: 0, color: appColorGray1,),
                                    value: isAllChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _toggleCheckEntire();
                                      });

                                    }
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text("전체동의",style: TextStyles.sub_title16_b),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              buildCheckList("isServiceChecked", "[필수] 서비스 이용약관 동의",statusController.appInfo.serviceLink!),
                              SizedBox(height: 20,),
                              buildCheckList("isPolicyChecked", "[필수] 개인정보 보호정책 동의", statusController.appInfo.privacyLink!),
                              SizedBox(height: 20,),
                              buildCheckList("isMarketingChecked", "[선택] 홍보 및 마케팅 목적의 개인정보 수집 및 이용동의", statusController.appInfo.promotionLink!),

                              SizedBox(height: 20,),
                              buildCheckList("isAdChecked", "[선택] 광고성 정보 수신 동의", statusController.appInfo.adLink!),

                            ],
                          ),
                        ),



                      ],
                    ),
                  ],
                ),
                RectangleButton(
                  mode: 1,
                  action: () async{

                    if(checkList["isServiceChecked"] == true && checkList["isPolicyChecked"] == true){

                      widget.member.promotionAgree = checkList["isMarketingChecked"];
                      widget.member.adAgree = checkList["isAdChecked"];



                      try{
                        _showOverlay(context);
                        await authController.addMember(widget.member);
                        await authController.login(widget.member.memberEmail!,widget.member.memberPassword!);
                        _hideOverlay();
                        Get.offAll(()=>MainPage(initialPage: 4,));
                        getCommonSnackbar("반값습니다 ${widget.member.memberName}님", "기본 회원가입이 완료되었습니다.\n프로필 및 서류정보를 입력한 뒤 심사요청을 해주세요.");

                      }catch(error){
                        _hideOverlay();
                        getCautionSnackbar(error.toString());
                      }


                    }else{

                      getCautionSnackbar("필수약관에 체크해주세요");
                    }


                  },
                  name: "확인",
                ),

              ],
            )
        ),
      ],
    );
  }

  Row buildCheckList(String which , String title , String url) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  activeColor: appColorPrimary,
                                  checkColor: appColorWhite,
                                  side: BorderSide(width: 0, color: appColorGray1,),
                                  value: checkList[which],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkList[which] = value!;
                                      _updateCheckEntire();
                                    });
                                  }
                              ),
                            ),
                            SizedBox(width: 5,),
                            SizedBox(
                                width: 200,
                                child: Text(title,style: TextStyles.contents14_b)),

                          ],
                        ),
                        GestureDetector(
                            onTap: (){
                              Get.to(()=>TermDetailPage(url: url,));
                            },
                            child: Text("보기",style: TextStyles.contents10_g1,))

                      ],
                    );
  }

}
