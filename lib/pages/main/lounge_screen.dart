
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/lounge_card.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/model/vo/appInfo_vo.dart';
import 'package:pluv/pages/main/lounge_write_page.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../component/custom_progress_indicator.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';
import '../../model/vo/lounge_vo.dart';

///LoungeScreen
///담당자 : saran
///설명 : 라운지 스크린. 커뮤니티 페이지인데 일반 게시판의 성격

class LoungeScreen extends StatefulWidget {
  const LoungeScreen({Key? key}) : super(key: key);

  @override
  State<LoungeScreen> createState() => _RoungeScreenState();
}

class _RoungeScreenState extends State<LoungeScreen> {

  @override
  void initState() {
    super.initState();
    //라운지 정보를 가져옴
    getLoungeList(categoryType: "전체");
    logger.i("LoungeScreen");
    //카테고리 리스트에 전체와 best를 포함하면서 어드민에서 정의한 카테고리 정보를 불러와 담음
    loungeCategoryList =[
      CodeInfoVo(title: "전체",code: "전체"),CodeInfoVo(title: "best",code: "best"),..._statusController!.appInfo!.loungeCategoryCode!
    ];
  }
  //상태관리 의존성
  DataController _dataController = Get.find<DataController>();
  StatusController _statusController = Get.find<StatusController>();
  //카테고리 인덱스임. 실제 페이지 인덱스나 스크린 인덱스를 뜻하는건 아님
  int _currentIndex = 0;
  //호출로 인해 재정의되는 라운지 게시물 리스트
  List<LoungeVo>? items;
  //firestore 호출시 페이징을 위해 마지막 document 저장
  DocumentSnapshot? _lastDocument;
  //동글동글이용
  bool _loading = false;

  //조건에 맞는 라운지글 호출 메소드
  Future<void> getLoungeList({required String categoryType,DocumentSnapshot? lastDocument}) async{
    setState(() {
      _loading = true;
    });
    try{

      Map<String,dynamic> result = await _dataController.searchLoungeList(categoryType: categoryType,lastDocument: lastDocument);
      if(lastDocument==null){

        items =result["loungeList"] ;
      }else{
        if(result["loungeList"]==null){

          getCautionSnackbar("더이상 리스트가 없어요");
        }else{
          items =[...items??[],...result["loungeList"]] ;
        }

      }
      _lastDocument =result["lastDocument"] ;
    }catch(e){
      logger.e(e);
    }
    setState(() {
      _loading = false;
    });
  }

  //라운지 카테고리 리스트
  List<CodeInfoVo> loungeCategoryList =[];
  //리프레시 컨트롤러. 리스트를 아래로 당겨 새로고침 하거나 리스트를 더불러올때 진행 상태 정보를 얻기위함
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  //스크롤 상단에서 새로고침용
  void _onRefresh() async{
     await getLoungeList(categoryType: loungeCategoryList[_currentIndex].code!);
    _refreshController.refreshCompleted();
  }

  //아래 스크롤 시 페이징으로 더 불러올때용
  void _onLoading() async{
    await getLoungeList(categoryType: loungeCategoryList[_currentIndex].code!,lastDocument: _lastDocument);
    _refreshController.loadComplete();
  }
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
              itemCount: loungeCategoryList.length,
              itemBuilder: (context, index) {

                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _currentIndex = index;
                      getLoungeList(categoryType: loungeCategoryList[index].code!);
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
                          child: Text((loungeCategoryList[index].title!),style:_currentIndex == index?TextStyles.sub_title15_b.copyWith(color: appColorPrimary2): TextStyles.sub_title15_g1,)),
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
                  child: SmartRefresher(
                    enablePullDown: true,
                      enablePullUp: true,
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                      header: const ClassicHeader(
                        spacing: 0,
                        releaseText: '값을 불러오는중',
                        completeText: '완료',
                        idleText: "새로고침",
                      ),
                      footer: const ClassicFooter(
                        spacing: 0,
                        loadingText: '',
                        canLoadingText: '',
                        idleText: '',
                      ),

                    child: ListView.separated(
                      physics: ClampingScrollPhysics(),
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





