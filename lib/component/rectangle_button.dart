import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/global.dart';
import '../global/text_styles.dart';

///RectangleButton
///담당자 : ---

class RectangleButton extends StatefulWidget {

  final String name;
  const RectangleButton({Key? key , required this.name}) : super(key: key);

  @override
  State<RectangleButton> createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {

  @override
  void initState() {
    super.initState();
    logger.i("RectangleButton");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

          foregroundColor: Colors.black,
          overlayColor: appColorPrimary,
          side: BorderSide(color: Colors.black, width: 1), // 테두리 색상
          fixedSize: Size(Get.width,44), // 높이를 50으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // 모서리를 직각으로 설정
          ),
        ),
        onPressed: (){},
        child: Text(widget.name,style: TextStyles.sub_title13_b,),
      ),
    );
  }
}
