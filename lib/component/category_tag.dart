import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/global.dart';
import 'package:pluv/global/text_styles.dart';

import '../model/vo/appInfo_vo.dart';

///CategoryTag
///담당자 : ---

class CategoryTag extends StatefulWidget {
  final String text;
  const CategoryTag({Key? key , required this.text}) : super(key: key);

  @override
  State<CategoryTag> createState() => _CategoryTagState();
}

class _CategoryTagState extends State<CategoryTag> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18,
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1,),
              borderRadius: BorderRadius.circular(50)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text,style:TextStyles.sub_title10_b.copyWith(color: appColorPrimary)),
            ],
          ),
        ),
      ],
    );
  }
}
