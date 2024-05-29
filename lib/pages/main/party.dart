import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../component/dot.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///Party
///담당자 : ---

class Party extends StatefulWidget {
  const Party({Key? key}) : super(key: key);

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> {

  @override
  void initState() {
    super.initState();
    logger.i("Party");
  }


  int _currentIndex = 0;

  String sample = "https://media.istockphoto.com/id/1827291486/ko/%EC%82%AC%EC%A7%84/%EC%A0%84%EB%8B%B4-%EB%A9%98%ED%86%A0%EA%B0%80-%ED%9A%8C%EC%82%AC-%ED%9A%8C%EC%9D%98%EC%8B%A4%EC%97%90-%EC%95%89%EC%95%84-%EB%A9%98%ED%8B%B0%EB%93%A4%EC%97%90%EA%B2%8C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%9D%98-%EC%A4%91%EC%9A%94%EC%84%B1%EC%9D%84-%EC%84%A4%EB%AA%85%ED%95%98%EA%B3%A0-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=1024x1024&w=is&k=20&c=-5zIBAjhFs34gMPafx5iQ-QhFP8IfQ8OUQrweW7c4tM=";
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
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      children: [
                        //인기파티
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("인기파티",style: TextStyles.title2,),
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
                                  return Container(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                                width: (Get.width-50)/2,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network(sample,fit: BoxFit.cover,)),
                                                )),
                                            Positioned(
                                              left: 5,
                                              top: 5,
                                              child: Container(
                                                height: 18,
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(width: 1,),
                                                    color: Colors.white ,
                                                    borderRadius: BorderRadius.circular(50)
                                                ),
                                                child: Center(child: Text("2:2 미팅",style: TextStyle(fontSize: 10,height: 1),)),
                                              ),
                                            ),
                                            Positioned(
                                              right: 5,
                                              bottom: 5,
                                              child: Container(
                                                height: 18,
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                decoration: BoxDecoration(
                                                    color: Colors.black.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(50)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.supervisor_account,size: 14,color: Colors.white,),
                                                    SizedBox(width: 5,),
                                                    Text("1",style: TextStyle(color: Colors.white,fontSize: 10),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: (Get.width-50)/2,
                                          child: Column(
                                            children: [
                                              Text("파티제목파티제목파티제목파티제목파티제목",style: TextStyles.subTitle1,),
                                              SizedBox(height: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("19분 전",style: TextStyles.subTitle2,),
                                                  Container(
                                                    width: 24,height: 24,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPurple2),
                                                    child: Center(child: Text("남",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
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
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [

                                    GestureDetector(
                                      onTap: (){},
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
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
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      top: 5,
                                      child: Container(
                                        height: 18,
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1,),
                                            color: Colors.white ,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: Center(child: Text("2:2 미팅",style: TextStyle(fontSize: 10,height: 1),)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      bottom: 5,
                                      child: Container(
                                        height: 18,
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.supervisor_account,size: 14,color: Colors.white,),
                                            SizedBox(width: 5,),
                                            Text("1",style: TextStyle(color: Colors.white,fontSize: 10),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text("파티제목 텍스트파티제목목목",style: TextStyles.subTitle1,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("19분 전"),
                                    Container(
                                      width: 16,height: 16,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPurple2),
                                      child: Center(child: Text("남",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
                                    )
                                  ],
                                ),
                              ],
                            ); // 여기서 YourGridItemWidget은 각 그리드 아이템을 나타내는 위젯입니다.
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
