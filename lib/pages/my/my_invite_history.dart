import 'package:flutter/material.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///MyInviteHistory
///담당자 : ---

class MyInviteHistory extends StatefulWidget {
  const  MyInviteHistory({Key? key}) : super(key: key);

  @override
  State<MyInviteHistory> createState() => _MyInviteHistoryState();
}

class _MyInviteHistoryState extends State<MyInviteHistory> {

  @override
  void initState() {
    super.initState();
    logger.i("MyInviteHistory");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "내가 초대한 내역"),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) {

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text("[굿굿티티디] 님이 내 초대코드를 입력해 \n포인트 5개 충전")),
                Expanded(
                    flex: 1,
                    child: Text("3시간 전",textAlign: TextAlign.end,style: TextStyles.contents13_g1,))
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 0.5,);
        },
      ),
    );
  }
}
