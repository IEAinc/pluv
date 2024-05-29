import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/global/global.dart';

class TextStyles {

  static TextStyle title1 = GoogleFonts.notoSansKr(
  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),color: appColorTextBlack
  );
  static TextStyle title2 = GoogleFonts.notoSansKr(
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),color: appColorTextBlack
  );

  static TextStyle subTitle1 = GoogleFonts.notoSansKr(
      textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),color: appColorTextBlack
  );
  static TextStyle subTitle2 = GoogleFonts.notoSansKr(
      textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,height: 1),color: appColorTextGrey
  );
  static TextStyle tab1Select = GoogleFonts.notoSansKr(
      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),color: appColorPrimary
  );
  static TextStyle tab1Unselect = GoogleFonts.notoSansKr(
      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),color: appColorGray
  );



}
