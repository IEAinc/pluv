import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

///앱 칼라

const appColorPrimary = Color(0xFF5C4DD1);
const appColorPrimary2 = Color(0xFF100556);
const appColorBlack = Color(0xFF1B1D1F);
const appColorWhite = Color(0xFFFFFFFF);
const appColorDeepGray = Color(0xFF555555);
const appColorGray1 = Color(0xFF73787E);
const appColorGray2 = Color(0xFF929292);
const appColorGray3 = Color(0xFF9FA4A8);
const appColorGray4 = Color(0xFFCCCCCC);
const appColorGray5 = Color(0xFFD9D9D9);
const appColorGray6 = Color(0xFFE1E1E1);
const appColorRed1 = Color(0xFFFF0000);
const appColorRed2 = Color(0xFFDC6568);


///SharedPreferences
late SharedPreferences prefs;

///로거
Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 1,
    lineLength: 130,
    colors: true,
    printEmojis: false,
    printTime: false,
  ),
);

AppBar customAppBar({String? title , List<Widget>? actions}) {
  return AppBar(
    title:title==null?null:Text(title!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),) ,
      centerTitle: true,
      leading: IconButton(onPressed: (){
        Get.back();
      },icon: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 16,height: 16,),),
      actions: actions,

  );
}