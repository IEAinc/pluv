import 'package:flutter/material.dart';
import 'package:pluv/global/global.dart';
import 'package:pluv/global/text_styles.dart';

///CategoryTag
///담당자 : ---

class CategoryTag extends StatefulWidget {
  const CategoryTag({Key? key}) : super(key: key);

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
    return Container(
      height: 18,
      width: 50,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1,),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Center(child: Text("자유",style:TextStyles.sub_title10_b.copyWith(color: appColorPrimary))),
    );
  }
}
