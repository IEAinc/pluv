import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/global/global.dart';

///TextLogo
///담당자 : saran
///설명 : 텍스트 로고

class TextLogo extends StatefulWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  State<TextLogo> createState() => _TextLogoState();
}

class _TextLogoState extends State<TextLogo> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Text("pluv",style: GoogleFonts.goblinOne(
      textStyle: TextStyle(fontSize: 19),color: appColorPrimary
    ));
  }
}
