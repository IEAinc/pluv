import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/category_tag.dart';
import 'package:pluv/component/common_tag.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///PartyDetailPage
///담당자 : ---

class PartyDetailPage extends StatefulWidget {
  const PartyDetailPage({Key? key}) : super(key: key);

  @override
  State<PartyDetailPage> createState() => _PartyDetailPageState();
}

class _PartyDetailPageState extends State<PartyDetailPage> {

  @override
  void initState() {
    super.initState();
    logger.i("PartyDetailPage");
  }
  String sample = "https://media.istockphoto.com/id/1827291486/ko/%EC%82%AC%EC%A7%84/%EC%A0%84%EB%8B%B4-%EB%A9%98%ED%86%A0%EA%B0%80-%ED%9A%8C%EC%82%AC-%ED%9A%8C%EC%9D%98%EC%8B%A4%EC%97%90-%EC%95%89%EC%95%84-%EB%A9%98%ED%8B%B0%EB%93%A4%EC%97%90%EA%B2%8C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%9D%98-%EC%A4%91%EC%9A%94%EC%84%B1%EC%9D%84-%EC%84%A4%EB%AA%85%ED%95%98%EA%B3%A0-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=1024x1024&w=is&k=20&c=-5zIBAjhFs34gMPafx5iQ-QhFP8IfQ8OUQrweW7c4tM=";
  String sampleText = "34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.34세 진지한 만남을 찾습니다.을 찾습니다.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        
        children: [

          Expanded(
            child: Column(
            
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        width: Get.width,
                        color: Colors.red,
                        child: Image.network(sample,fit: BoxFit.cover,),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top,
                      child: Container(
                        width: Get.width,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 16,height: 16,colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn))),
                              SvgPicture.asset('assets/images/myicon/dot.svg',width: 16,height: 16, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.supervisor_account,size: 14,color: appColorPrimary,),
                                Text("15 명 참가중",style: TextStyles.sub_title12_b.copyWith(color: appColorPrimary),),
                              ],
                            ),
                            Text("34세 진지한 만남 찾습니다±!!",style: TextStyles.title18_b,),
                          ],
                        ),
                        Divider(height: 30,),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            child: Column(
                              children: [
                                Wrap(
                                  spacing: 5.0, // 수평 간격
                                  runSpacing: 8.0, // 수직 간격
                                  alignment: WrapAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [

                                    IntrinsicWidth(child: CommonTag(text: "01.26(수) 오늘",stringIcon: calender,)),
                                    IntrinsicWidth(child: CommonTag(text: "오후 4시",stringIcon: watch,)),
                                    IntrinsicWidth(child: CommonTag(text: "신사동 가로수길",stringIcon: pin,)),
                                    IntrinsicWidth(child: CommonTag(text: "2:2 미팅",stringIcon: meeting,)),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(sampleText,style: TextStyles.contents15_b,),

                              ],
                            ),
                          ),
                        ),
                  
                      ],
                    ),
                  ),
                ),
            
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: appColorGray5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/myicon/star_fill.svg',width: 16,colorFilter: ColorFilter.mode(appColorRed2, BlendMode.srcIn)),
                          SizedBox(height: 3,),
                          Text("찜",style: TextStyles.contents10_b,)
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: appColorPrimary2,
                          minimumSize: Size(0, 0),
                          overlayColor: appColorWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onPressed: (){},
                        child: Text("파티 참여하기",style: TextStyles.sub_title14_w,),
                      ),
                    )

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
