import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/category_tag.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
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
          Container(
            width: Get.width,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.supervisor_account,size: 14,color: appColorPrimary,),
                        Text("15 명 참가중"),
                      ],
                    ),
                    Text("34세 진지한 만남 찾습니다±!!"),
                  ],
                ),
                Divider(height: 30,),
                Row(
                  children: [
                    CategoryTag(),
                    CategoryTag(),
                    CategoryTag(),
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
