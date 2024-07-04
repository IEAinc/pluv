import 'package:flutter/material.dart';
import 'package:pluv/global/global.dart';

import '../global/text_styles.dart';

///Dot
///담당자 : ---

class Dot extends StatefulWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 2,
      height: 2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: appColorBlack),
    );
  }
}
