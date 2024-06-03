import 'package:flutter/material.dart';
import 'package:pluv/global/global.dart';
import 'package:pluv/global/text_styles.dart';

///DDayTag
///담당자 : ---

class DDayTag extends StatefulWidget {
  const DDayTag({Key? key}) : super(key: key);

  @override
  State<DDayTag> createState() => _DDayTagState();
}

class _DDayTagState extends State<DDayTag> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: appColorPrimary ,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Center(child: Text("D-1",style:TextStyles.contents10_w,)),
    );
  }
}
