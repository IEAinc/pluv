import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/category_tag.dart';
import 'package:pluv/component/view_status.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import '../pages/main/lounge_detail_page.dart';
import 'dot.dart';

///LoungeCard
///담당자 : ---

class LoungeCard extends StatefulWidget {
  const LoungeCard({Key? key}) : super(key: key);

  @override
  State<LoungeCard> createState() => _LoungeCardState();
}

class _LoungeCardState extends State<LoungeCard> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeCard");
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
            CategoryTag(),
            Text("라운지 등록된 제목 텍스트 최대 한줄",style: TextStyles.title20_b,),
            SizedBox(height: 10,),
            ViewStatus()
          ],
        ),
      ),
    );
  }
}
