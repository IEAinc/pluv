import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/global.dart';
import '../global/text_styles.dart';

///RectangleButton
///담당자 : ---

class RectangleButton extends StatefulWidget {

  final String name;
  void Function()? action;
  Color? backgroundColor;

  double? radius;
  TextStyle? textStyle;

  RectangleButton({Key? key , required this.name , this.action , this.backgroundColor ,this.radius , this.textStyle}) : super(key: key);

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
          backgroundColor: widget.backgroundColor,
          overlayColor: appColorPrimary,
          side: BorderSide(color: Colors.black, width: 1), // 테두리 색상
          fixedSize: Size(Get.width,44), // 높이를 50으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius??0), // 모서리를 직각으로 설정
          ),
        ),
        onPressed: (){
          if(widget.action !=null){
            widget.action!();
          }
        },
        child: Text(widget.name,style: widget.textStyle??TextStyles.sub_title13_b,),
      ),
    );
  }
}
