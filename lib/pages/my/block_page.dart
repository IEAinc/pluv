import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluv/component/basic_botton.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///BlockPage
///담당자 : ---

class BlockPage extends StatefulWidget {
  const BlockPage({Key? key}) : super(key: key);

  @override
  State<BlockPage> createState() => _BlockPageState();
}

class _BlockPageState extends State<BlockPage> {

  @override
  void initState() {
    super.initState();
    logger.i("BlockPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "아는 사람 피하기"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("아는 사람 피하기",style: TextStyles.title18_b,),
            SizedBox(height: 10,),
            Text("내 연락처에 있는 사람들을 차단할 수 있고\n연락처에 없는 사람은 직접 등록할 수 있어요.",style: TextStyles.contents15_b,),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/icon/account.svg',width: 16,height: 16,),
                    SizedBox(width: 5,),
                    Text("내 연락처 불러오기",style: TextStyles.sub_title15_b,),
                  ],
                ),
                BasicButton(name: "불러오기")
                
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/icon/phone.svg',width: 16,height: 16,),
                    SizedBox(width: 5,),
                    Text("직접 등록하기",style: TextStyles.sub_title15_b,),
                  ],
                ),
                BasicButton(name: "추가하기")


              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
