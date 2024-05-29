import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///Home
///담당자 : ---

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    logger.i("Home");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("오늘의 카드" , style: TextStyles.title1,),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: Get.height/2,
              child: GridView.builder(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 그리드 열 수
                    childAspectRatio: 3/4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                itemBuilder: (BuildContext context, int index) {
                  // index에 따라 각 아이템을 생성
                  return GestureDetector(
                    onTap: (){
                      setState(() {
      
                      });
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2023/01/03/16/00/dog-7694676_1280.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return Container(
                              color: appColorGray,
      
                            );
                          },
                        )
                    ),
                  ); // 여기서 YourGridItemWidget은 각 그리드 아이템을 나타내는 위젯입니다.
                },
                itemCount: 6, // 그리드에 표시할 전체 아이템 수
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("나에게 꼭 맞는\n이상형을 찾아드려요!" , style: TextStyles.title1,),
                Text("더보기  >" , style: TextStyles.subTitle1,),

              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 ),
                    height: 82,
                    width: Get.width,
                  decoration: BoxDecoration(
                      color: appColorWhiteGray2.withOpacity(0.25),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon/medal.svg',),
                      SizedBox(width: 10,),
                      Text("프로톡 상위 4% 이성 만나기",style: TextStyles.title2,),
                      SizedBox(width: 10,),
                      SvgPicture.asset('assets/images/icon/hot.svg',),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 ),
                  height: 82,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: appColorWhiteGray2.withOpacity(0.25),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon/medal.svg',),
                      SizedBox(width: 10,),
                      Text("프로톡 상위 4% 이성 만나기",style: TextStyles.title2,),
                      SizedBox(width: 10,),
                      SvgPicture.asset('assets/images/icon/hot.svg',),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 ),
                  height: 82,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: appColorWhiteGray2.withOpacity(0.25),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon/medal.svg',),
                      SizedBox(width: 10,),
                      Text("프로톡 상위 4% 이성 만나기",style: TextStyles.title2,),
                      SizedBox(width: 10,),
                      SvgPicture.asset('assets/images/icon/hot.svg',),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 ),
                  height: 82,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: appColorWhiteGray2.withOpacity(0.25),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon/medal.svg',),
                      SizedBox(width: 10,),
                      Text("프로톡 상위 4% 이성 만나기",style: TextStyles.title2,),
                      SizedBox(width: 10,),
                      SvgPicture.asset('assets/images/icon/hot.svg',),
                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

