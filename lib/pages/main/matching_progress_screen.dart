import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/party_card.dart';

import '../../component/profile_card.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///MatchingProgressScreen
///담당자 : ---

class MatchingProgressScreen extends StatefulWidget {
  const MatchingProgressScreen({Key? key}) : super(key: key);

  @override
  State<MatchingProgressScreen> createState() => _MatchingProgressScreenState();
}

class _MatchingProgressScreenState extends State<MatchingProgressScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("MatchingProgressScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("오늘의 카드",style: TextStyles.title24_b,),
            SizedBox(height: 10,),
            Container(
              height: (Get.width-40)/3 * (5/4),
              // color: Colors.red,
        
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10,);
                },
                itemBuilder: (context, index) {
                  return ProfileCard();
                },
              ),
            ),
            SizedBox(height: 30,),
            Text("내가 보낸 좋아요",style: TextStyles.title24_b,),
            SizedBox(height: 10,),
            Container(
              height: (Get.width-40)/3 * (5/4),
              // color: Colors.red,
        
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10,);
                },
                itemBuilder: (context, index) {
                  return ProfileCard();
                },
              ),
            ),
            SizedBox(height: 30,),
            Text("내가 보낸 높은 평가",style: TextStyles.title24_b,),
            SizedBox(height: 10,),
            Container(
              height: (Get.width-40)/3 * (5/4),
              // color: Colors.red,
        
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10,);
                },
                itemBuilder: (context, index) {
                  return ProfileCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
