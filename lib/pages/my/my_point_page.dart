import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/my/point_history_page.dart';

import '../../global/global.dart';

///MyPointPage
///담당자 : ---

class MyPointPage extends StatefulWidget {
  const MyPointPage({Key? key}) : super(key: key);

  @override
  State<MyPointPage> createState() => _MyPointPageState();
}

class _MyPointPageState extends State<MyPointPage> {

  @override
  void initState() {
    super.initState();
    logger.i("MyPointPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "내 포인트",actions: [GestureDetector(
          onTap: (){
            Get.to(()=>PointHistoryPage());
          },
          child: Text("내역보기",style: TextStyles.contents14_g1,)),SizedBox(width: 16,)]),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 100,
              child: Center(child: Text("현재 보유한 포인트 : 1개",style: TextStyles.contents15_b,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("포인트구매하기",style: TextStyles.title18_b,),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Column(
              children: [
                Stack(
                  children: [
                    ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 직각으로 설정
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(

                              children: [
                                //포인트로고
                                Container(
                                    width: 40,
                                    height: 40,
                                    child: SvgPicture.asset('assets/images/icon/point_icon.svg')),
                                SizedBox(width: 10,),
                                //내용
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("포인트 115개",style: TextStyles.sub_title16_g1,),
                                    Text("100개 + 15개",style: TextStyles.contents14_g1,)
                                  ],
                                ),
                              ],
                            ),

                            //금액
                            Text("₩50,000",style: TextStyles.sub_title16_b,)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),

                            decoration: BoxDecoration(
                                color: appColorPrimary2,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                            ),
                            child: Text("best",style:TextStyles.sub_title12_w ,))
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Stack(
                  children: [
                    ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 직각으로 설정
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(

                              children: [
                                //포인트로고
                                Container(
                                    width: 40,
                                    height: 40,
                                    child: SvgPicture.asset('assets/images/icon/point_icon.svg')),
                                SizedBox(width: 10,),
                                //내용
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("포인트 115개",style: TextStyles.sub_title16_g1,),
                                    Text("100개 + 15개",style: TextStyles.contents14_g1,)
                                  ],
                                ),
                              ],
                            ),

                            //금액
                            Text("₩50,000",style: TextStyles.sub_title16_b,)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),

                            decoration: BoxDecoration(
                                color: appColorPrimary2,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                            ),
                            child: Text("best",style:TextStyles.sub_title12_w ,))
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Stack(
                  children: [
                    ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 직각으로 설정
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(

                              children: [
                                //포인트로고
                                Container(
                                    width: 40,
                                    height: 40,
                                    child: SvgPicture.asset('assets/images/icon/point_icon.svg')),
                                SizedBox(width: 10,),
                                //내용
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("포인트 115개",style: TextStyles.sub_title16_g1,),
                                    Text("100개 + 15개",style: TextStyles.contents14_g1,)
                                  ],
                                ),
                              ],
                            ),

                            //금액
                            Text("₩50,000",style: TextStyles.sub_title16_b,)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),

                            decoration: BoxDecoration(
                                color: appColorPrimary2,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                            ),
                            child: Text("best",style:TextStyles.sub_title12_w ,))
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Stack(
                  children: [
                    ElevatedButton(

                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 직각으로 설정
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(

                              children: [
                                //포인트로고
                                Container(
                                    width: 40,
                                    height: 40,
                                    child: SvgPicture.asset('assets/images/icon/point_icon.svg')),
                                SizedBox(width: 10,),
                                //내용
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("포인트 115개",style: TextStyles.sub_title16_g1,),
                                    Text("100개 + 15개",style: TextStyles.contents14_g1,)
                                  ],
                                ),
                              ],
                            ),

                            //금액
                            Text("₩50,000",style: TextStyles.sub_title16_b,)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),

                            decoration: BoxDecoration(
                                color: appColorPrimary2,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                            ),
                            child: Text("best",style:TextStyles.sub_title12_w ,))
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
