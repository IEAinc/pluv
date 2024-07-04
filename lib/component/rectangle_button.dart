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
  int? mode;
  bool? able;

  RectangleButton({Key? key , required this.name , this.action , this.backgroundColor ,this.radius , this.textStyle ,this.mode , this.able}) : super(key: key);

  @override
  State<RectangleButton> createState() => _RectangleButtonState();
}

class _RectangleButtonState extends State<RectangleButton> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:widget.mode==1?ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: appColorWhite,
          backgroundColor: widget.able == false?appColorGray8:widget.backgroundColor??appColorPrimary2,
          overlayColor: appColorWhite,
          fixedSize: Size(Get.width,48), // 높이를 50으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius??5 ), // 모서리를 직각으로 설정
          ),
        ),
        onPressed: (){

          if(widget.able == false){
          }else{
            if(widget.action !=null){
              widget.action!();
            }
          }

        },
        child: Text(widget.name,style:widget.textStyle??TextStyles.sub_title16_w),
      ): ElevatedButton(
        style: ElevatedButton.styleFrom(

          foregroundColor: Colors.black,
          backgroundColor: widget.backgroundColor??Colors.white,
          overlayColor: appColorPrimary,
          side: BorderSide(color: Colors.black, width: 1), // 테두리 색상
          fixedSize: Size(Get.width,44), // 높이를 50으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius??0), // 모서리를 직각으로 설정
          ),
        ),
        onPressed: (){
          if(widget.able == false){
          }else{
            if(widget.action !=null){
              widget.action!();
            }

          }
        },
        child: Text(widget.name,style: widget.textStyle??TextStyles.sub_title13_b,),
      ),
    );
  }
}
