import 'package:flutter/material.dart';

import '../global/global.dart';
import '../global/text_styles.dart';

///CommonTag
///담당자 : ---

class CommonTag extends StatefulWidget {
  final String text;
  String? stringIcon;
  CommonTag({Key? key , required this.text , this.stringIcon}) : super(key: key);

  @override
  State<CommonTag> createState() => _CommonTagState();
}

class _CommonTagState extends State<CommonTag> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1,),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: [
          Text("${widget.stringIcon}"),
          Text(widget.text,style:TextStyles.contents13_b),
        ],
      ),
    );
  }
}
