import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/dot.dart';
import 'package:pluv/component/lounge_card.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/pages/main/lounge_write_page.dart';

import '../../component/custom_progress_indicator.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';
import '../../model/dto/lounge_dto.dart';
import '../../model/vo/lounge_vo.dart';

///LoungeScreen
///담당자 : ---

class LoungeScreen extends StatefulWidget {
  const LoungeScreen({Key? key}) : super(key: key);

  @override
  State<LoungeScreen> createState() => _RoungeScreenState();
}

class _RoungeScreenState extends State<LoungeScreen> {

  @override
  void initState() {
    super.initState();
    getLoungeList();
    logger.i("LoungeScreen");

  }
  DataController _dataController = Get.find<DataController>();
  StatusController _statusController = Get.find<StatusController>();
  int _currentIndex = 0;
  List<LoungeVo>? items;
  DocumentSnapshot? lastDocument;
  bool _loading = false;

  void getLoungeList() async{
    setState(() {
      _loading = true;
    });
    try{
      Map<String,dynamic> result = await _dataController.searchLoungeList(bigQuery: false,categoryType: "best", page: 0 ,lastDocument: lastDocument);
      items =result["loungeList"] ;
      lastDocument =result["lastDocument"] ;

    }catch(e){
      logger.e(e);
    }
    setState(() {
      _loading = false;
    });
  }

  List<String> loungeCategoryList =[
    "전체","best","CT_RO_01", "CT_RO_02", "CT_RO_03",
  ];

  String findCode(String code){
    return _statusController.appInfo.loungeCategoryCode?[code]??code;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
                        onTap: (){

                          getLoungeList();
                        },
                        child: Text("실험용버튼"),
                      ),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20),
            color: Color(0xFFfafafa),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: loungeCategoryList.length,
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
                          child: Text(findCode(loungeCategoryList[index]),style:_currentIndex == index?TextStyles.sub_title15_b.copyWith(color: appColorPrimary2): TextStyles.sub_title15_g1,)),
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
                    itemCount: items?.length??0,
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    itemBuilder: (context, index) {
                      return LoungeCard(item:items![index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 30,color: appColorGray5,);
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
                      Get.to(()=>LoungeWritePage());
                    },
                    child: SvgPicture.asset('assets/images/myicon/pen.svg',colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                  ),
                ),
                if(_loading)
                  Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white.withOpacity(0.5),
                    child: Center(child: CustomProgressIndicator()),
                  )
              ],
            ),
          )

        ],
      ),
    );
  }
}





