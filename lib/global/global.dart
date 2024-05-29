import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

String heart = "💞";
String heart1 = "👀";
String heart2 = "💌";
String heart3 = "💞";
String heart4 = "💞";
String heart5 = "💞";
String heart6 = "💞";
String heart7 = "💞";

///앱 칼라

const appColorPrimary = Color(0xFF100556);
const appColorPurple = Color(0xFF5E49FF);
const appColorPurple2 = Color(0xFF5C4DD1);
const appColorWhiteGray = Color(0xFFF8F8F8);
const appColorWhiteGray2 = Color(0xFFececec);
const appColorGray = Color(0xFF8E8E8E);
const appColorRed = Color(0xFFff0000);
const appColorRed2 = Color(0xFFdc6568);
const appColorTextGrey = Color(0xFF73787E);
const appColorTextBlack = Color(0xFF1b1d1f);


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

AppBar customAppBar({String? title}) {
  return AppBar(
    title:title==null?null:Text(title!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),) ,
      centerTitle: true,
      leading: IconButton(onPressed: (){
        Get.back();
      },icon: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 16,height: 16,),)
  );
}