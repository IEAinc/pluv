import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/pages/main/main_page.dart';

import '../../component/custom_input_filed.dart';
import '../../component/custom_progress_indicator.dart';
import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../signup/sign_up_condition_page.dart';

///LoginPage
///담당자 : saran
///설명 : 이메일 비밀번호를 치고 로그인하는 페이지

class LoginPage extends StatefulWidget {
  const    LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    logger.i("LoginPage");
  }


  AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>(); //form키 validation을 위함

  String email = ''; //이메일
  String password = ''; //비밀번호
  bool isLoading=false; //로그인 진행중일때 앞에 progress띄어주기 위함


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(title: "로그인하기"),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 30,),
                    //form
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomInputFiled(
                            keyboardType: TextInputType.emailAddress,
                            labelText: "이메일",
                            fillColor: appColorWhite,
                            borderLineColor: appColorBlack,
                            onChanged: (val){
                              setState(() {
                                email = val;
                              });
                            },
                            suffix: false,
                            validator: (val) {
                              if(val.length < 1) {
                                return '이메일은 필수사항입니다.';
                              }
                              //global.dart에 정의한 이메일 매칭판단 함수를 통해 판단
                              if(!RegExpEmail.hasMatch(val)){
                                return '잘못된 이메일 형식입니다.';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20,),
                          CustomInputFiled(
                            maxLength: 20,
                            labelText: "비밀번호",
                            fillColor: appColorWhite,
                            borderLineColor: appColorBlack,
                            obscureText: true,
                            onChanged: (val){
                              setState(() {
                                password = val;
                              });
                            },

                            validator: (val) {
                              if(val.length < 1) {
                                return '비밀번호는 필수사항입니다.';
                              }

                              if(val.length < 8){
                                return '8자 이상 입력해주세요!';
                              }
                              return null;
                            },
                            suffix: true,
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    //로그인 버튼
                    Center(child: RectangleButton(
                      name: "로그인",
                      able: true,
                      mode: 1,
                      action: () async{

                        // validate 를 먼저 체크함
                        if(this._formKey.currentState!.validate()){
                          this._formKey.currentState!.save();

                          // 빙글빙글이 발동
                          setState(() {
                            isLoading = true;
                          });
                          try{
                            // 로그인 시도
                            bool result = await authController.login(email, password);
                            if(result){
                              //성공하면 스넥바 띄어주고 메인 페이지로 이동.
                              getCommonSnackbar('반갑습니다. ${email}님',"");
                              Get.offAll(MainPage(initialPage: 0,));
                            }else{
                              getCommonSnackbar('로그인 실패 ','탈퇴한 회원입니다.');
                            }

                          }catch(error){
                            //실패하면 스넥바
                            logger.e(error);
                            getCommonSnackbar('로그인에 실패 하였습니다',error.toString());
                          }finally{
                            //동글동글이 종료
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                    )
                    ),


                    SizedBox(height: 100,),
                    //회원가입
                    Center(child: Text("회원가입하기")),
                    SizedBox(height: 20,),
                    //이메일 회원가입할수있는 페이지로 이동
                    Center(
                        child: RectangleButton(
                          mode: 1,
                          able: true,
                          name: "이메일 회원가입",
                          action: (){Get.to(()=>SignUpConditionPage());},

                        )),
                    SizedBox(height: 20,),
                    //로그인안해도 일단 앱이 어떤지 한번 둘러보기위해 만든 기능인데,의견 수렴후 빼든,하든 결정
                    Center(child: GestureDetector(
                        onTap: (){
                          Get.offAll(()=>MainPage(initialPage: 4));
                        },
                        child: Text("둘러보기"))),
                  ],
                ),
              ),
            ),
            //동글동글이
            if(isLoading)
              Container(
                width: Get.width,
                height: Get.height,
                color: Colors.white.withOpacity(0.5),
                child: Center(child: CustomProgressIndicator()),
              )
          ],
        ),
      )
    );
  }



}
