import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/signup_bottom_sheet.dart';
import 'package:pluv/model/vo/member_vo.dart';
import '../../component/rectangle_button.dart';
import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///SignUpPage
///담당자 : saran
///설명 : 기본 회원가입 페이지. 일단 여기서 가입하면 데이터베이스에 아주 기초 정보 등록됨

class SignUpPage extends StatefulWidget {
  //앞의 본인인증 페이지에서 정보가 넘어와야함
  final Map<String,dynamic> result;
  const SignUpPage({Key? key , required this.result}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  void initState() {
    super.initState();
    logger.i("SignUpPage");
    setState(() {
      memberName = widget.result["NAME"];
      memberGender = widget.result["SEX"]=="1"?true:false;
      memberBirth = widget.result["DOB"];
      memberPhone = widget.result["PHONE"];
      memberCi = widget.result["CI"];
      memberDi = widget.result["DI"];
    });
  }

  final _formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();
  String memberEmail = ''; //이메일
  String password = ''; //비밀번호
  String memberName = ""; //이름(본인인증에서 넘어옴)
  bool memberGender = true; //성별(본인인증에서 넘어옴)
  String memberBirth = ""; //생년월일(본인인증에서 넘어옴)
  String memberPhone = ""; //폰번호(본인인증에서 넘어옴)
  String memberCi = ""; //CI(본인인증에서 넘어옴)
  String memberDi = ""; //DI(본인인증에서 넘어옴)

  int emailDuplicated = 0; //0 = 중복체크안함 , 1 = 이메일중복임 , 2= 이메일중복아님

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(title: "회원가입"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            height: Get.height-kToolbarHeight-MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("아이디와 비밀번호를\n만들어주세요.",style: TextStyles.title20_b,),
                    SizedBox(height: 40,),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("이메일 주소(로그인 ID)",style: TextStyles.title15_b,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Expanded(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (val) {
                                    if(val!.length < 1) {
                                      return '이메일은 필수사항입니다.';
                                    }
                                    if(!RegExpEmail.hasMatch(val)){
                                      return '잘못된 이메일 형식입니다.';
                                    }
                                
                                    return null;
                                  },
                                  onChanged: (val){
                                    setState(() {
                                      emailDuplicated = 0;
                                      memberEmail = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                
                                    labelText: "이메일 주소를 입력해주세요.",
                                    labelStyle: TextStyles.contents15_g1,
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: appColorGray1, width: 1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: appColorPrimary2, width: 1),
                                    ),
                                
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              GestureDetector(
                                onTap: () async{

                                  if(memberEmail!.length > 1 && RegExpEmail.hasMatch(memberEmail)){
                                    bool duplicated = await authController.checkEmailDuplicate(memberEmail);
                                    setState(() {
                                      if(duplicated){
                                        //중복
                                        emailDuplicated = 1;
                                      }else{
                                        //중복아님
                                        emailDuplicated = 2;
                                      }
                                    });
                                  }else{
                                    //이메일을 똑바로 입력하라고 스넥바
                                    getCautionSnackbar("이메일을 바르게 입력해주세요");
                                  }
                                },
                                child: Container(

                                    decoration: BoxDecoration(
                                      color: appColorPrimary2,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                    child: Text("중복체크",style: TextStyles.sub_title12_w,)),
                              ),
                            ],
                          ),
                          if(emailDuplicated==1)
                          Text("이미 사용중인 이메일 입니다",style: TextStyles.contents14_b.copyWith(color: appColorRed1),),
                          if(emailDuplicated==2)
                            Text("사용가능한 이메일 입니다",style: TextStyles.contents14_b.copyWith(color: appColorPrimary),),
                          const SizedBox(height: 20,),
                          Text("비밀번호",style: TextStyles.title15_b,),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText:true,
                              validator: (val) {
                                if(val!.length < 1) {
                                  return '비밀번호는 필수사항입니다.';
                                }

                                if(val.length < 8){
                                  return '8자 이상 입력해주세요!';
                                }

                                if(val.length > 16){
                                  return '16자 이하 입력해주세요!';
                                }

                                if(!RegExpPassword.hasMatch(val)){
                                  return '영문과 숫자 조합으로 해주세요.';
                                }
                                return null;
                              },
                            decoration: InputDecoration(

                              labelText: "영문과 숫자 조합 / 8자리이상, 16자리 이하",
                              labelStyle: TextStyles.contents15_g1,
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: appColorGray1, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary2, width: 1),
                              ),

                            ),
                            onChanged: (val){
                              setState(() {
                                password = val;
                              });
                            },
                          ),

                          const SizedBox(height: 20,),
                          Text("비밀번호 확인",style: TextStyles.title15_b,),

                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                              obscureText:true,
                            validator: (val) {
                              if(val!.length < 1) {
                                return '비밀번호 확인은 필수사항입니다.';
                              }

                              if(val.length < 8){
                                return '8자 이상 입력해주세요!';
                              }

                              if(val.length > 16){
                                return '16자 이하 입력해주세요!';
                              }

                              if(!RegExpPassword.hasMatch(val)){
                                return '영문과 숫자 조합으로 해주세요.';
                              }

                              if(val != password){
                                return '비밀번호가 다릅니다. 확인해주세요!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(

                              labelText: "영문과 숫자 조합 / 8자리이상, 16자리 이하",
                              labelStyle: TextStyles.contents15_g1,
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: appColorGray1, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary2, width: 1),
                              ),

                            ),
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/images/icon/caution.svg',width: 16,height: 16,),
                              SizedBox(width: 3,),
                              Text('안심하세요! 이메일 주소는 로그인 ID로만 활용되며,\n타인에게 공개되지 않습니다. ',style: TextStyles.contents14_b.copyWith(height: 1),),
                            ],
                          ),


                        ],
                      ),
                    ),


                  ],
                ),
                Column(
                  children: [
                    RectangleButton(
                      mode: 1,
                      action: (){
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();

                          //통과되면 memberVo를 만들고 SignupBottomSheet에 member전달

                          MemberVo member = MemberVo(
                            memberEmail:memberEmail,
                            memberName:memberName,
                            memberBirth:memberBirth,
                            memberGender:memberGender,
                            memberPhone:memberPhone,
                            memberPassword: password,
                            memberCi: memberCi,
                            memberDi: memberDi,
                            fcmToken:"",
                          );

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return SignupBottomSheet(member: member,);
                            },
                          );

                        }else{

                          getCautionSnackbar("이메일과 비밀번호를 바르게 입력해주세요.");
                        }




                      },
                      name: "계정생성",
                    ),
                    SizedBox(height: 30,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }




}


