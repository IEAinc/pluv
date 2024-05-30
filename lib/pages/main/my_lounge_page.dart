 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

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
   }
   int _currentIndex = 0;
   final PageController _pageController = PageController(initialPage: 0);

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
                         child: Center(child: Text("내가 작성한 글",style:_currentIndex==0?TextStyles.title1_b: TextStyles.title1_b,)),
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
                         child: Center(child: Text("프로필 교환 내역",style:_currentIndex==1?TextStyles.title1_b: TextStyles.title1_b,)),
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
                   Text("d"),
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


