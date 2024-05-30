import 'package:flutter/material.dart';
import 'package:pluv/pages/main/in_party.dart';
import 'package:pluv/pages/main/like_party.dart';
import 'package:pluv/pages/main/my_party_my.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///MyPartyPage
///담당자 : ---

class MyPartyPage extends StatefulWidget {
  const MyPartyPage({Key? key}) : super(key: key);

  @override
  State<MyPartyPage> createState() => _MyPartyPageState();
}

class _MyPartyPageState extends State<MyPartyPage> {

  @override
  void initState() {
    super.initState();
    logger.i("MyPartyPage");
  }


  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "MY PARTY"),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _currentIndex=0;
                      });
                      _pageController.jumpToPage(0);
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:_currentIndex==0? appColorPrimary:Colors.transparent,width: 3))
                        ),
                        child: Center(child: Text("내 파티",style:_currentIndex==0?TextStyles.title1_b: TextStyles.title1_b,)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _currentIndex=1;
                      });
                      _pageController.jumpToPage(1);
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:_currentIndex==1? appColorPrimary:Colors.transparent,width: 3))
                        ),
                        child: Center(child: Text("참여한 파티",style:_currentIndex==1?TextStyles.title1_b: TextStyles.title1_b,)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _currentIndex=2;
                      });
                      _pageController.jumpToPage(2);
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:_currentIndex==2? appColorPrimary:Colors.transparent,width: 3))
                        ),
                        child: Center(child: Text("찜 목록",style:_currentIndex==2?TextStyles.title1_b: TextStyles.title1_b,)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 1,),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  MyPartyMy(),
                  InParty(),
                  LikeParty()
                ],
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
