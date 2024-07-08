import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


String loadingProgress ='assets/lottie/loading.json';
String logoPath = "assets/images/pluvlogo.png";
int maxLimit = 10; //파이어스토어 리밋
///icon

String calender = "🗓";
String watch = "⏰";
String pin = "📍";
String meeting = "👩‍❤️‍👨";

///앱 칼라

const appColorPrimary = Color(0xFF5C4DD1);
const appColorPrimary2 = Color(0xFF100556);
const appColorBlack = Color(0xFF1B1D1F);
const appColorWhite = Color(0xFFFFFFFF);
const appColorDeepGray1 = Color(0xFF555555);

const appColorGray1 = Color(0xFF73787E);
const appColorGray2 = Color(0xFF7C7C7C);
const appColorGray3 = Color(0xFF929292);
const appColorGray4 = Color(0xFF9FA4A8);
const appColorGray5 = Color(0xFFBBBBBB);
const appColorGray6 = Color(0xFFCCCCCC);
const appColorGray7 = Color(0xFFD9D9D9);
const appColorGray8 = Color(0xFFE1E1E1);
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

AppBar customAppBar({String? title , List<Widget>? actions ,VoidCallback? backFunction}) {
  return AppBar(
    title:title==null?null:Text(title!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),) ,
      centerTitle: true,
      leading: IconButton(onPressed: (){
        if (backFunction != null) {
          backFunction();
        } else {
          Get.back();
        }

      },icon: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 16,height: 16,),),
      actions: actions,

  );
}

//랜덤 한글 문자열 얻기
String generateKoreanText(int wordCount) {
  const words = [
    '안녕하세요', '반갑습니다', '여러분', '플러터', '예제', '랜덤', '문자열',
    '생성', '테스트', '한국어', '로렘', '입숨', '텍스트', '입니다', '좋은', '하루',
    '되세요', '감사합니다', '즐거운', '시간', '보내세요', '행복하세요', '건강하세요'
  ];
  final random = Random();
  return List.generate(wordCount, (index) => words[random.nextInt(words.length)]).join(' ');
}

//랜덤영문문자열
String generateRandomString(int number) {
  const String chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final Random random = Random.secure();

  // 길이가 number인 랜덤 문자열 생성
  String randomString = '';
  for (int i = 0; i < number; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }

  return randomString;
}

String generateRandomKoreanNickname(int length) {
  const List<String> chosung = [
    'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
  ];
  const List<String> jungsung = [
    'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ'
  ];
  const List<String> jongsung = [
    '', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
  ];

  final Random random = Random();
  StringBuffer nickname = StringBuffer();

  for (int i = 0; i < length; i++) {
    String char = generateKoreanCharacter(random, chosung, jungsung, jongsung);
    nickname.write(char);
  }

  return nickname.toString();
}

String generateKoreanCharacter(Random random, List<String> chosung, List<String> jungsung, List<String> jongsung) {
  String chosungChar = chosung[random.nextInt(chosung.length)];
  String jungsungChar = jungsung[random.nextInt(jungsung.length)];
  String jongsungChar = jongsung[random.nextInt(jongsung.length)];

  int chosungIndex = chosung.indexOf(chosungChar);
  int jungsungIndex = jungsung.indexOf(jungsungChar);
  int jongsungIndex = jongsung.indexOf(jongsungChar);

  int unicode = 0xAC00 + (chosungIndex * 21 * 28) + (jungsungIndex * 28) + jongsungIndex;
  return String.fromCharCode(unicode);
}

//3자리마다 콤마
String formatCommaNumber(num num) {
  return num.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (Match match) {
    return '${match[1]},';
  });
}

String timeAgo(DateTime timestamp) {
  final now = DateTime.now();
  final difference = now.difference(timestamp);

  if (difference.inMinutes < 1){
    return '방금 전';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}분 전';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}시간 전';
  } else if (difference.inDays < 30) {
    return '${difference.inDays}일 전';
  } else if (difference.inDays < 365) {
    final months = difference.inDays ~/ 30;
    return '${months}개월 전';
  } else {
    final years = difference.inDays ~/ 365;
    return '${years}년 전';
  }
}

//timestamp to yyyy-mm-dd
String commonDate(Timestamp timestamp){
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  // 형식화
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  return formattedDate;
}


///스낵바
void getCommonSnackbar(String title , String subTitle){
  if(Get.isSnackbarOpen){
    Get.closeAllSnackbars();
  }
  Get.snackbar(
    title,
    subTitle,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black54,
    colorText: Colors.white,
    duration: Duration(seconds: 2),
    onTap: (f){
      Get.closeAllSnackbars();
    },
  );
}



//주의 스넥바
void getCautionSnackbar(String message){
  if(Get.isSnackbarOpen){
    Get.closeAllSnackbars();
  }
  Get.snackbar(
    message,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: appColorGray8,
    colorText: appColorBlack,

    onTap: (f){
      Get.closeAllSnackbars();
    },
    titleText: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/icon/caution.svg',colorFilter: ColorFilter.mode(appColorRed1, BlendMode.srcIn)),
          SizedBox(width: 5,),
          Expanded(child: Text(message,softWrap: true,)),
        ],
      ),
    ),
    messageText: SizedBox(),


    // titleText: SizedBox(),

    duration: Duration(seconds: 2),
  );
}


///이미지픽
Future<XFile?> pickImage({double? compressWidth}) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxWidth: compressWidth);
  return pickedFile;
}


///정규식

RegExp RegExpEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');



RegExp RegExpPassword = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$');