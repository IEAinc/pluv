import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///PartyWritePage
///담당자 : ---

class PartyWritePage extends StatefulWidget {
  const PartyWritePage({Key? key}) : super(key: key);

  @override
  State<PartyWritePage> createState() => _PartyWritePageState();
}

class _PartyWritePageState extends State<PartyWritePage> {

  @override
  void initState() {
    super.initState();
    logger.i("PartyWritePage");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(title: "파티 만들기",actions: [Text('등록'),SizedBox(width: 16,)]),
        body: Column(
          children: [
            Divider(height: 1,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5,color: appColorGray3))),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('카테고리 선택',style: TextStyles.sub_title15_b,),
                  Transform.rotate(
                    angle: 270 * 3.1415927 / 180, // 90도 회전 (라디안으로 변환)
                    child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,),
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal:16),
              child: Column(
                children: [
                  TextFormField(
                      style: TextStyles.sub_title15_b,
                      decoration: InputDecoration(
                        hintText: "파티 제목을 입력해주세요.",
                        enabledBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: appColorGray2,)
                        ),
                        focusedBorder: UnderlineInputBorder(

                            borderSide: BorderSide(color: appColorGray2)
                        ),
                      )

                  ),
                  TextFormField(
                      maxLines: 10,
                      style: TextStyles.contents15_b,
                      decoration: InputDecoration(
                        hintText: "내용을 입력해주세요.",
                        enabledBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.transparent,)
                        ),
                        focusedBorder: UnderlineInputBorder(

                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                      )

                  ),

                ],

              ),
            ),


            Container(
              padding: EdgeInsets.symmetric(horizontal:16),
              child: Column(
                children: [
                  TextFormField(
                      style: TextStyles.sub_title15_b,
                      decoration: InputDecoration(
                        hintText: "위치를 입력해주세요.",
                        prefixIcon: Text(pin),
                        hintStyle: TextStyles.contents15_g1,
                        prefixIconConstraints: BoxConstraints(),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(

                            borderSide: BorderSide(
                              color: appColorGray2,)
                        ),
                        focusedBorder: UnderlineInputBorder(

                            borderSide: BorderSide(color: appColorGray2)
                        ),
                      )

                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(calender),
                      Text("날짜를 선택해주세요.",style: TextStyles.contents15_g1,)
                    ],
                  ),
                  Divider()
                ]
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2023/01/03/16/00/dog-7694676_1280.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                return Container(
                                  color: appColorGray1,

                                );
                              },
                            )
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(

                            width: 12,
                            height: 12,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: appColorGray1.withOpacity(0.9),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                            ),

                            child: SvgPicture.asset('assets/images/myicon/ax.svg',colorFilter: ColorFilter.mode(appColorWhite, BlendMode.srcIn)),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 72,
                    height: 72,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2023/01/03/16/00/dog-7694676_1280.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return Container(
                              color: appColorGray1,

                            );
                          },
                        )
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 72,
                    height: 72,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2023/01/03/16/00/dog-7694676_1280.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return Container(
                              color: appColorGray1,

                            );
                          },
                        )
                    ),
                  ),
                ],
              ),
            ),
            Divider(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/myicon/picture.svg',width: 12,height: 12,),
                  SizedBox(width: 5,),
                  Text("0/3")
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
