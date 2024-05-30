import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import 'dot.dart';

///ViewStatus
///담당자 : ---

class ViewStatus extends StatefulWidget {
  const ViewStatus({Key? key}) : super(key: key);

  @override
  State<ViewStatus> createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,height: 24,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPrimary2),
          child: Center(child: Text("남",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
        ),
        SizedBox(width: 5,),
        Text("19분 전",style: TextStyles.title1_b,),
        Dot(),
        Row(
          children: [
            SvgPicture.asset('assets/images/myicon/eye.svg',width: 13,colorFilter: ColorFilter.mode(appColorPrimary2, BlendMode.srcIn)),
            SizedBox(width: 5,),
            Text("19,000",style: TextStyles.title1_b,),
          ],
        ),
        Dot(),
        Row(
          children: [
            SvgPicture.asset('assets/images/icon/chatbubble.svg',colorFilter: ColorFilter.mode(appColorPrimary2, BlendMode.srcIn)),
            SizedBox(width: 5,),
            Text("19,000",style: TextStyles.title1_b,),
          ],
        ),
      ],
    );
  }
}
