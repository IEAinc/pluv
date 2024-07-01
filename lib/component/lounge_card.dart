import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/category_tag.dart';
import 'package:pluv/component/view_status.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import '../model/dto/lounge_dto.dart';
import '../model/vo/lounge_vo.dart';
import '../pages/main/lounge_detail_page.dart';
import 'dot.dart';

///LoungeCard
///담당자 : ---

class LoungeCard extends StatefulWidget {
  final LoungeVo item;
  const LoungeCard({Key? key , required this.item}) : super(key: key);

  @override
  State<LoungeCard> createState() => _LoungeCardState();
}

class _LoungeCardState extends State<LoungeCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>LoungeDetailPage());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryTag(text: widget.item?.loungeCategoryCodeKorean??"",),
            Text(widget.item.loungeTitle??"",style: TextStyles.title20_b,),
            SizedBox(height: 10,),
            ViewStatus(
                gender :widget.item.writerGender??true,
                time:widget.item?.loungeCreateDate??Timestamp.now(),
                viewCount : widget.item?.viewCount??0,
                commentCount:0
            ),
          ],
        ),
      ),
    );
  }
}
