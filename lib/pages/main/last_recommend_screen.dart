import 'package:flutter/material.dart';

import '../../component/party_card.dart';
import '../../component/profile_card.dart';
import '../../global/global.dart';

///LastRecommendScreen
///담당자 : ---

class LastRecommendScreen extends StatefulWidget {
  const LastRecommendScreen({Key? key}) : super(key: key);

  @override
  State<LastRecommendScreen> createState() => _LastRecommendScreenState();
}

class _LastRecommendScreenState extends State<LastRecommendScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("LastRecommendScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 그리드 열 수
            childAspectRatio: 4/5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20
        ),
        itemBuilder: (BuildContext context, int index) {
          // index에 따라 각 아이템을 생성
          return ProfileCard(); // 여기서 YourGridItemWidget은 각 그리드 아이템을 나타내는 위젯입니다.
        },
        itemCount: 26, // 그리드에 표시할 전체 아이템 수
      ),
    );
  }
}
