import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import 'dot.dart';

///ViewStatus
///담당자 : ---

class ViewStatus extends StatefulWidget {

  final bool gender;
  final Timestamp time;
  final num viewCount;
  final num commentCount;

  const ViewStatus({
    Key? key,
    required this.gender,
    required this.time,
    required this.viewCount,
    required this.commentCount,

  }) : super(key: key);

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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:widget.gender?appColorPrimary2:appColorRed2),
          child: Center(child: Text(widget.gender?"남":"여",style: TextStyles.sub_title12_w,)),
        ),
        SizedBox(width: 5,),
        Text(timeAgo(widget.time.toDate()),style: TextStyles.sub_title12_g1,),
        Dot(),
        Row(
          children: [
            SvgPicture.asset('assets/images/myicon/eye.svg',width: 13,colorFilter: ColorFilter.mode(appColorGray1, BlendMode.srcIn)),
            SizedBox(width: 5,),
            Text(formatCommaNumber(widget.viewCount),style: TextStyles.sub_title12_g1,),

          ],
        ),
        Dot(),
        Row(
          children: [
            SvgPicture.asset('assets/images/icon/chatbubble.svg',colorFilter: ColorFilter.mode(appColorGray1, BlendMode.srcIn)),
            SizedBox(width: 5,),
            Text(formatCommaNumber(widget.commentCount),style: TextStyles.sub_title12_g1,),
          ],
        ),
      ],
    );
  }
}
