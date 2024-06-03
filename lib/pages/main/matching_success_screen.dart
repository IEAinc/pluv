import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/profile_card.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///MatchingSuccessScreen
///담당자 : ---

class MatchingSuccessScreen extends StatefulWidget {
  const MatchingSuccessScreen({Key? key}) : super(key: key);

  @override
  State<MatchingSuccessScreen> createState() => _MatchingSuccessScreenState();
}

class _MatchingSuccessScreenState extends State<MatchingSuccessScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("MatchingSuccessScreen");
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
            Text('매칭 완료',style: TextStyles.title24_b,),
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
