import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluv/component/dot.dart';
import 'package:pluv/component/lounge_card.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///LoungeScreen
///담당자 : ---

class LoungeScreen extends StatefulWidget {
  const LoungeScreen({Key? key}) : super(key: key);

  @override
  State<LoungeScreen> createState() => _RoungeScreenState();
}

class _RoungeScreenState extends State<LoungeScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeScreen");
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20),
            color: Color(0xFFfafafa),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 2,vertical: 7),
                          decoration: BoxDecoration(
                              border:_currentIndex == index? Border(bottom: BorderSide(color: appColorPrimary,width: 3)):null
                          ),
                          child: Text("전체",style:_currentIndex == index?TextStyles.sub_title15_b.copyWith(color: appColorPrimary2): TextStyles.sub_title15_g1,)),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10,);
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    itemCount: 10,
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    itemBuilder: (context, index) {
                      return LoungeCard();
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 30,color: appColorGray5,);
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColorPrimary, // 버튼 배경색
                      foregroundColor: Colors.white,
                      shape: CircleBorder(), // 완전히 둥근 형태
                      padding: EdgeInsets.all(12), // 버튼 크기
                    ),
                    onPressed: () {
                      // 버튼 클릭 시 동작
                    },
                    child: SvgPicture.asset('assets/images/myicon/pen.svg',colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}





