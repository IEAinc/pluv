import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pluv/component/custom_input_filed.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///LoungeWritePage
///담당자 : ---

class LoungeWritePage extends StatefulWidget {
  const LoungeWritePage({Key? key}) : super(key: key);

  @override
  State<LoungeWritePage> createState() => _LoungeWritePageState();
}

class _LoungeWritePageState extends State<LoungeWritePage> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeWritePage");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(title: "라운지 글쓰기"),
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
                          hintText: "라운지 제목을 입력해주세요.",
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
            Divider(),
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
                        child: Container(
                          width: 12,
                          height: 12,
                          color: appColorGray1.withOpacity(0.9),
                          child: Icon(Icons.),
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

