import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/category_tag.dart';
import 'package:pluv/component/view_status.dart';
import 'package:pluv/controller/status_controller.dart';

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

  StatusController _statusController = Get.find<StatusController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>LoungeDetailPage(loungeKey: widget.item.loungeKey!));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryTag(text: _statusController.findTitleByCode(_statusController.appInfo.loungeCategoryCode!, widget.item.loungeCategoryCode!)),
                  Text(widget.item.loungeTitle??"",style: TextStyles.sub_title16_b,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 10,),
                  ViewStatus(
                      gender :widget.item.writerGender??true,
                      time:widget.item?.loungeCreateDate??Timestamp.now(),
                      viewCount : widget.item?.viewCount??0,
                      commentCount: widget.item.commentList!.length+widget.item.comment2List!.length
                  ),
                ],
              ),
            ),
            if(widget.item.loungeImageList!.length>0)
            ExtendedImage.network(
              widget.item.loungeImageList!.first??"",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              cache: true,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              loadStateChanged: (ExtendedImageState state) {
                if (state.extendedImageLoadState == LoadState.failed) {
                  return Image.asset(
                    logoPath,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
