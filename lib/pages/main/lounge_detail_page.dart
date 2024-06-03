import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/view_status.dart';

import '../../component/category_tag.dart';
import '../../component/custom_input_filed.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///LoungeDetailPage
///담당자 : ---

class LoungeDetailPage extends StatefulWidget {
  const LoungeDetailPage({Key? key}) : super(key: key);

  @override
  State<LoungeDetailPage> createState() => _LoungeDetailPageState();
}

class _LoungeDetailPageState extends State<LoungeDetailPage> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeDetailPage");
  }

  List<String> sampleImages = [

  'https://cdn.pixabay.com/photo/2020/08/22/17/51/boat-5509027_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/05/18/15/41/teeth-8770514_640.jpg',
    'https://via.placeholder.com/600x400',
  ];
  String sample = "안녕하세요. 저는 매일 화요일, 목요일 새벽 수영을 하며 건강한 삶을 살고 있습니다. 이 곳에서 좋은 인연을 만나 가벼운 관계가 아닌 서로에게 긍정적인 영향을 주는 관계로 발전하기 위해 가입했습니다.안녕하세요. ";

  final FocusNode _focusNode = FocusNode();


  TextEditingController commentController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();

        },
        child: Scaffold(
          appBar: customAppBar(
              title: "자세히보기" ,
              actions: [
                SvgPicture.asset('assets/images/myicon/dot.svg',height: 15,),
                SizedBox(width: 15  ,)]),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CategoryTag(),
                                  Text("라운지 등록된 제목 텍스트 최대 한줄",style: TextStyles.title24_b,),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ViewStatus(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                                height: Get.height/3,
                                child: SingleChildScrollView(
                                  physics: ClampingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      //텍스트영역
                                      Container(
                                          constraints: BoxConstraints(maxHeight: Get.height/3/2),
                                          child: Text(sample+sample+sample,)),
                                      SizedBox(height: 10,),
                                      //만약이미지가 있다면
                                      Container(
                                        constraints: BoxConstraints(maxHeight: Get.height/2),
                                        child: PageView.builder(
                                          itemCount: sampleImages.length,
                                          itemBuilder: (context, index) {
                                            return Image.network(
                                              sampleImages[index],
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      )
                
                                    ],
                                  ),
                                )
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset('assets/images/myicon/heart.svg',colorFilter: ColorFilter.mode(appColorRed2 , BlendMode.srcIn),height: 15,),
                                              SizedBox(width: 4,),
                                              Text("공감",style: TextStyles.title24_b,),
                                              SizedBox(width: 4,),
                                              Text("0",style: TextStyles.title24_b,),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: VerticalDivider(
                                        color: Colors.black,
                                        thickness: 1,
                                        width: 20,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset('assets/images/icon/chatbubble.svg',colorFilter: ColorFilter.mode(appColorPrimary , BlendMode.srcIn)),
                                              SizedBox(width: 4,),
                                              Text("댓글",style: TextStyles.title24_b,),
                                              SizedBox(width: 4,),
                                              Text("0",style: TextStyles.title24_b,),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                
                                    foregroundColor: Colors.black,
                                    overlayColor: appColorPrimary,
                                    side: BorderSide(color: Colors.black, width: 1), // 테두리 색상
                                    fixedSize: Size(Get.width,44), // 높이를 50으로 설정
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero, // 모서리를 직각으로 설정
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Text("v",style: TextStyles.title24_b,),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      Divider(thickness: 15,color: Color(0xFFf9f9f9),),
                      //댓글
                      Container(
                        constraints: BoxConstraints(minHeight: Get.height/3),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            SvgPicture.asset('assets/images/icon/chatbubble.svg',height: 30,),
                            Text("등록된 댓글이 없습니다.\n제일 먼저 댓글을 남겨보세요!",textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: appColorGray1),
                          )),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          SizedBox(
                            width: 10,
                          ),

                          Expanded(
                            child: CustomInputFiled(
                              focusNode: _focusNode,
                              labelText: "공개 댓글 작성",
                              controller: commentController,
                              fillColor: Color(0xFFf9f9f9),
                              keyboardType: TextInputType.multiline,
                              borderRadius: 5,

                              contentsPaddingVertical: 10,
                              maxLine: _focusNode.hasFocus?3:1,
                              minLines: 1,
                              isDense: true,
                              onChanged: (val) {
                                setState(() {
                                  // comment = val;
                                });
                              },
                              suffix: false,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),
                          if(_focusNode.hasFocus)
                          GestureDetector(
                              onTap: () async {

                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.send))
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



