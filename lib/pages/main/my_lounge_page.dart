 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../component/custom_progress_indicator.dart';
import '../../component/lounge_card.dart';
import '../../controller/auth_controller.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';
import '../../model/vo/lounge_vo.dart';
import 'lounge_write_page.dart';

 ///MyLoungePage
 ///담당자 : ---

 class MyLoungePage extends StatefulWidget {
   const MyLoungePage({Key? key}) : super(key: key);

   @override
   State<MyLoungePage> createState() => _MyLoungePageState();
 }

 class _MyLoungePageState extends State<MyLoungePage> {

   @override
   void initState() {
     super.initState();
     logger.i("MyLoungePage");
     getMemberLoungeList();
   }

   List<LoungeVo>? items;
   bool _loading = false;
   DataController _dataController = Get.find<DataController>();
   AuthController _authController = Get.find<AuthController>();
   //firestore 호출시 페이징을 위해 마지막 document 저장
   DocumentSnapshot? _lastDocument;
   //조건에 맞는 라운지글 호출 메소드
   Future<void> getMemberLoungeList({DocumentSnapshot? lastDocument}) async{
     setState(() {
       _loading = true;
     });
     try{
       Map<String,dynamic> result = await _dataController.getMemberLoungeList(writerUid:  _authController.myInfo!.memberUid!,lastDocument: lastDocument);
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


   int _currentIndex = 0;
   final PageController _pageController = PageController(initialPage: 0);

   RefreshController _refreshController = RefreshController(initialRefresh: false);


   //스크롤 상단에서 새로고침용
   void _onRefresh() async{
     await getMemberLoungeList();
     _refreshController.refreshCompleted();
   }

   //아래 스크롤 시 페이징으로 더 불러올때용
   void _onLoading() async{
     await getMemberLoungeList(lastDocument: _lastDocument);
     _refreshController.loadComplete();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: customAppBar(title: "MY 라운지"),
       body: Container(
         padding: EdgeInsets.symmetric(vertical: 10),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         _currentIndex=0;
                       });
                       _pageController.jumpToPage(0);
                     },
                     child: Center(
                       child: Container(
                         height: 40,
                         width: 120,
                         decoration: BoxDecoration(
                             border: Border(bottom: BorderSide(color:_currentIndex==0? appColorPrimary:Colors.transparent,width: 3))
                         ),
                         child: Center(child: Text("내가 작성한 글",style:_currentIndex==0?TextStyles.sub_title15_b: TextStyles.sub_title15_g1,)),
                       ),
                     ),
                   ),
                 ),
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         _currentIndex=1;
                       });
                       _pageController.jumpToPage(1);
                     },
                     child: Center(
                       child: Container(
                         height: 40,
                         width: 130,
                         decoration: BoxDecoration(
                             border: Border(bottom: BorderSide(color:_currentIndex==1? appColorPrimary:Colors.transparent,width: 3))
                         ),
                         child: Center(child: Text("프로필 교환 내역",style:_currentIndex==1?TextStyles.sub_title15_b: TextStyles.sub_title15_g1,)),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
             Divider(height: 1,),
             Expanded(
               child: PageView(
                 controller: _pageController,
                 children: <Widget>[
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
                   Text("sdd"),
                 ],
                 onPageChanged: (index) {
                   setState(() {
                     _currentIndex = index;
                   });
                 },
               ),
             ),
           ],
         ),
       ),
     );
   }
 }


