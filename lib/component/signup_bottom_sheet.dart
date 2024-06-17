import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/global.dart';
import '../global/text_styles.dart';

///SignupBottomSheet
///담당자 : ---

class SignupBottomSheet extends StatefulWidget {
  const SignupBottomSheet({Key? key}) : super(key: key);

  @override
  State<SignupBottomSheet> createState() => _SignupBottomSheetState();
}

class _SignupBottomSheetState extends State<SignupBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("SignupBottomSheet");
  }


  bool _isAllChecked =false;
  bool _isServiceChecked =false;
  bool _isPolicyChecked =true;
  bool _isMarketingChecked =false;
  bool _isAdChecked =false;

  void allCheck(){

    if(_isAllChecked){
      _isServiceChecked =true;
      _isPolicyChecked =true;
      _isMarketingChecked =true;
      _isAdChecked =true;
    }else{
      _isServiceChecked =false;
      _isPolicyChecked =false;
      _isMarketingChecked =false;
      _isAdChecked =false;
    }

  }

  void checkConfirm(){
    if(
    _isServiceChecked==true && _isPolicyChecked==true &&_isMarketingChecked==true&& _isAdChecked==true
    )  {
      _isAllChecked =true;
    }else{
      _isAllChecked =false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height/2,
        width: Get.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: appColorWhite
        ),
        child: Column(
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
                            value: _isAllChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isAllChecked = value!;
                                allCheck();
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
                      buildCheck(),
                      SizedBox(height: 20,),
                      Row(
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
                                value: _isPolicyChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isPolicyChecked = value!;
                                    checkConfirm();
                                  });
                                }
                            ),
                          ),
                          SizedBox(width: 5,),
                          SizedBox(
                              width: 200,
                              child: Text("[필수] 개인정보 보호정책 동의 수집 및 이용동의",style: TextStyles.contents14_b)),
                          SizedBox(width: 20,),
                          GestureDetector(
                              onTap: (){
                                // normalLaunchUrl("https://www.eslc.go.kr/normalyouth/privacy.do");
                              },
                              child: Text("보기",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))

                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
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
                                value: _isAdChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isAdChecked = value!;
                                    checkConfirm();
                                  });
                                }
                            ),
                          ),
                          SizedBox(width: 5,),
                          SizedBox(
                              width: 200,
                              child: Text("[선택] 광고성 정보 수신 동의",style: TextStyles.contents14_b,)),
                          SizedBox(width: 20,),
                          GestureDetector(
                              onTap: (){
                                // normalLaunchUrl("https://www.eslc.go.kr/normalyouth/privacy.do");
                              },
                              child: Text("보기",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))

                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
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
                                value: _isMarketingChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isMarketingChecked = value!;
                                    checkConfirm();
                                  });
                                }
                            ),
                          ),
                          SizedBox(width: 5,),
                          SizedBox(
                              width: 200,
                              child: Text("마케팅이용동의(선택)",style: TextStyles.contents14_b)),
                          SizedBox(width: 20,),
                          GestureDetector(
                              onTap: (){
                                // normalLaunchUrl("https://www.eslc.go.kr/normalyouth/privacy.do");
                              },
                              child: Text("보기",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))

                        ],
                      ),
                    ],
                  ),
                ),



              ],
            ),

          ],
        )
    );
  }

  Row buildCheck({required bool value , required String title }) {
    return Row(
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
                              value: value,

                              onChanged: (bool? v) {
                                setState(() {
                                  value = v!;
                                  checkConfirm();
                                });
                              }
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(title,style: TextStyles.contents14_b),
                              GestureDetector(
                                  onTap: (){
                                  },
                                  child: Text("보기",style: TextStyles.contents10_g1,))
                            ],
                          ),
                        ),
                      ],
                    );
  }
}
