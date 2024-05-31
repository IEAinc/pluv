import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/party_card.dart';

import '../../component/dot.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///PartyScreen
///담당자 : ---

class PartyScreen extends StatefulWidget {
  const PartyScreen({Key? key}) : super(key: key);

  @override
  State<PartyScreen> createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("PartyScreen");
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
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      children: [
                        //인기파티
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("인기파티",style: TextStyles.title24_b,),
                            SizedBox(height: 10,),
                            Container(
                              height: (Get.width-50)/2 + 75,
                              // color: Colors.red,
                  
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 10,);
                                },
                                itemBuilder: (context, index) {
                                  return PartyCard(type: 1,);
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 50,),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // 그리드 열 수
                              childAspectRatio: 3/5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // index에 따라 각 아이템을 생성
                            return PartyCard(type: 2); // 여기서 YourGridItemWidget은 각 그리드 아이템을 나타내는 위젯입니다.
                          },
                          itemCount: 6, // 그리드에 표시할 전체 아이템 수
                        )

                      ],
                    ),
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
