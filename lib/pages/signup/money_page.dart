
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/templete/paper_template.dart';
import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';


///MoneyPage
///담당자 : saran
///설명 : 자산인증 페이지

class MoneyPage extends StatefulWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends PaperTemplate<MoneyPage> {

  @override
  void initState() {
    super.initState();
    logger.i("MoneyPage");
    //기존 업로드했던 자산 서류 이미지 가져오기
    findImageList("PAPER_ASSET");
  }



  List<Map<String,dynamic>> _tabList =[
    {
      "type": "부동산",
      "explain" : "30억원 이상의 건물을 소유한 건물주",
      "select1" : "부동산 등기서류 또는 매매 계약서",
      "select2" : "네이버 부동산 실거래가 캡쳐 화면",
      "imageList" : [
        'assets/images/exam/asset_1.png',
        'assets/images/exam/asset_2.png',
      ]
    },
    {
      "type": "현금",
      "explain" : "5억원 이상의 현금을 보유한 고객 자산가",
      "select1" : "시중 은행 잔고 또는 잔액 증명서",
      "select2" : "모바일뱅킹 앱 캡쳐 화면",
      "imageList" : [
        'assets/images/exam/asset_3.png',
        'assets/images/exam/asset_4.png',
      ]
    },

  ];
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: customAppBar(title: "자산"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            child: Column(
              children: [
                Container(

                  width: Get.width,
                  child:  Row(
                      children: _tabList.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> item = entry.value;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    width: _currentIndex == index?2:1,
                                    color: _currentIndex == index?appColorPrimary :appColorGray8,
                                  ))
                              ),
                              child: Text(
                                item["type"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: appColorPrimary.withOpacity(0.03),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SvgPicture.asset('assets/images/icon/exclamation.svg',width: 12,),
                              ),
                              SizedBox(width: 5,),
                              Expanded(child: Text(_tabList[_currentIndex]["explain"],style: TextStyles.contents15_b,maxLines: 3,overflow: TextOverflow.ellipsis,))


                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("인증방법",style: TextStyles.title16_b,),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: appColorPrimary,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                      child: Center(child: Text("선택 1",style: TextStyles.sub_title12_w,)),
                                    ),
                                    SizedBox(width: 8,),
                                    Text(_tabList[_currentIndex]["select1"],style: TextStyles.contents15_b,),

                                  ],
                                ),
                                if(_tabList[_currentIndex]["select2"] != null)
                                  Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: appColorPrimary,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                            child: Center(child: Text("선택 2",style: TextStyles.sub_title12_w,)),
                                          ),
                                          SizedBox(width: 8,),
                                          Text(_tabList[_currentIndex]["select2"],style: TextStyles.contents15_b,),

                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),


                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("인증예시",style: TextStyles.title16_b,),
                                SizedBox(width: 10,),
                                Text("모든 인증 자료는 확인 용도로만 사용 됩니다.",style: TextStyles.sub_title13_g1,),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Stack(
                              children: [
                                Container(

                                    height: moreToggle?null:100,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            ..._tabList[_currentIndex]["imageList"].map((imageUrl) => Image.asset(imageUrl)).toList()
                                          ]
                                      ),
                                    )),
                                Positioned(
                                    bottom: 0,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          moreToggle = !moreToggle;
                                        });
                                      },
                                      child: Container(
                                        color: appColorPrimary.withOpacity(0.2),
                                        height: 30,
                                        width: Get.width-32,
                                        child: Center(child: Text(moreToggle?"닫기":"더보기",style: TextStyles.sub_title12_b,)),
                                      ),
                                    ))
                              ],
                            )



                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("인증 확인용 자료 업로드",style: TextStyles.title16_b,),

                            SizedBox(height: 10,),
                            Row(
                              children: [
                                picture_box(0),
                                SizedBox(width: 10,),
                                picture_box(1),
                                SizedBox(width: 10,),
                                picture_box(2),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("모든 인증 자료는 확인 용도로만 사용되며 상대에게 세부 사항은 공개되지 않습니다. 상대에게 뱃지 보유 여부만 표시합니다.",style: TextStyles.sub_title13_g1,),


                          ],
                        ),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                paperSaveButton("PAPER_ASSET"),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
        if(loading)
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white.withOpacity(0.5),
            child: Center(child: CustomProgressIndicator()),
          )
      ],
    );
  }


}

