import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///PointHistoryPage
///담당자 : ---

class PointHistoryPage extends StatefulWidget {
  const PointHistoryPage({Key? key}) : super(key: key);

  @override
  State<PointHistoryPage> createState() => _PointHistoryPageState();
}

class _PointHistoryPageState extends State<PointHistoryPage> {

  @override
  void initState() {
    super.initState();
    logger.i("PointHistoryPage");
  }

  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "내 포인트 내역"),
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
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:_currentIndex==0? appColorPrimary:Colors.transparent,width: 3))
                        ),
                        child: Center(child: Text("충전 내역",style:_currentIndex==0?TextStyles.title15_b: TextStyles.sub_title15_g1,)),
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
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:_currentIndex==1? appColorPrimary:Colors.transparent,width: 3))
                        ),
                        child: Center(child: Text("사용 내역",style:_currentIndex==1?TextStyles.title15_b: TextStyles.sub_title15_g1,)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 1,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    ListView.separated(
                      itemCount: 100,
                      itemBuilder: (context, index) {

                        return Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset('assets/images/icon/point_icon.svg')),
                                  Container(
                                      width: 15,
                                      height: 15,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("포인트 구매완료 50,000원",style: TextStyles.contents15_b,),
                                      Text("포인트 115개 충전",style: TextStyles.sub_title15_b.copyWith(color: appColorPrimary2)),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text("3시간 전",textAlign: TextAlign.end,style: TextStyles.contents12_g1,))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 30,);
                      },
                    ),
                    ListView.separated(
                      itemCount: 100,
                      itemBuilder: (context, index) {

                        return Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset('assets/images/icon/point_icon.svg')),
                                  Container(
                                    width: 15,
                                    height: 15,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("포인트 구매완료 50,000원",style: TextStyles.contents15_b,),
                                      Text("포인트 115개 충전",style: TextStyles.sub_title15_b.copyWith(color: appColorPrimary2)),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text("3시간 전",textAlign: TextAlign.end,style: TextStyles.contents12_g1,))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 30,);
                      },
                    ),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
