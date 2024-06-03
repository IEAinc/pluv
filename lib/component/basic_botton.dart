import 'package:flutter/material.dart';

import '../global/global.dart';
import '../global/text_styles.dart';

///BasicButton
///담당자 : ---

class BasicButton extends StatefulWidget {
  final String name;
  const BasicButton({Key? key ,required this.name}) : super(key: key);

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          backgroundColor: appColorPrimary2,
          minimumSize: Size(0, 0),
          overlayColor: appColorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: (){},
        child: Text(widget.name,style: TextStyles.contents13_w,),
      ),
    );
  }
}
