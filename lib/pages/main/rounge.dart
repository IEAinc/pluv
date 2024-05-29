import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluv/component/dot.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///Rounge
///담당자 : ---

class Rounge extends StatefulWidget {
  const Rounge({Key? key}) : super(key: key);

  @override
  State<Rounge> createState() => _RoungeState();
}

class _RoungeState extends State<Rounge> {

  @override
  void initState() {
    super.initState();
    logger.i("Rounge");
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
                          child: Text("전체",style:_currentIndex == index?TextStyles.tab1Select: TextStyles.tab1Unselect,)),
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
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 18,
                              width: 50,
                              margin: EdgeInsets.only(bottom: 5),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(child: Text("자유",style: TextStyle(fontSize: 10,height: 1),)),
                            ),
                            Text("라운지 등록된 제목 텍스트 최대 한줄"),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Container(
                                  width: 24,height: 24,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPurple2),
                                  child: Center(child: Text("남",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
                                ),
                                SizedBox(width: 5,),
                                Text("19분 전",style: TextStyles.subTitle2,),
                                Dot(),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/images/myicon/eye.svg',width: 13,colorFilter: ColorFilter.mode(appColorTextGrey, BlendMode.srcIn)),
                                    SizedBox(width: 5,),
                                    Text("19,000",style: TextStyles.subTitle2,),
                                  ],
                                ),
                                Dot(),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/images/myicon/chatbubble.svg',width: 11,colorFilter: ColorFilter.mode(appColorTextGrey, BlendMode.srcIn)),
                                    SizedBox(width: 5,),
                                    Text("19,000",style: TextStyles.subTitle2,),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 30,color: appColorWhiteGray2,);
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





