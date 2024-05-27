import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

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
const appColorGray = Color(0xFF8E8E8E);
const appColorRed = Color(0xFFff0000);
const appColorRed2 = Color(0xFFdc6568);
const appColorTextGrey = Color(0xFF73787E);
const appColorTextBlack = Color(0xFF1b1d1f);

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