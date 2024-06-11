import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';

///CustomDialog
///담당자 : saran

class CustomDialog extends StatefulWidget {
  final Widget widget;


  const CustomDialog({Key? key , required this.widget}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  @override
  void initState() {
    super.initState();
    logger.i("CustomDialog");
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
        decoration: BoxDecoration(
            color: appColorWhite,
            borderRadius: BorderRadius.circular(10)
        ),
        child: widget.widget,
      ),
    );
  }
}
