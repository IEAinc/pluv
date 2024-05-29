import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/pages/main/my_lounge_page.dart';
import 'package:pluv/pages/main/party.dart';
import 'package:pluv/pages/main/rounge.dart';
import 'package:pluv/pages/main/search_page.dart';

import '../../global/global.dart';
import 'my_party_page.dart';

///Community
///담당자 : ---

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  @override
  void initState() {
    super.initState();
    logger.i("Community");
  }
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(onPressed: (){
                      setState(() {
                        _currentIndex = 0;
                      });
                      _pageController.jumpToPage(0);
                    }, child: Text("Lounge",style:_currentIndex==0? TextStyle(fontSize: 18,color: appColorTextBlack ,fontWeight: FontWeight.w700):TextStyle(fontSize: 18,color: appColorGray ,fontWeight: FontWeight.w500),),),

                    Text("|"),
                    TextButton(
                        onPressed: (){
                          setState(() {
                            _currentIndex = 1;
                          });
                          _pageController.jumpToPage(1);
                        },
                        child: Text("Party",style:_currentIndex==1? TextStyle(fontSize: 18,color: appColorTextBlack ,fontWeight: FontWeight.w700):TextStyle(fontSize: 18,color: appColorGray ,fontWeight: FontWeight.w500),),),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){


                      Get.to(SearchPage());

                    },visualDensity: VisualDensity.compact,icon: SvgPicture.asset('assets/images/myicon/search.svg',width: 15,),),
                    GestureDetector(
                        onTap: (){
                          if(_currentIndex==0){
                            Get.to(MyLoungePage());
                          }else{
                            Get.to(MyPartyPage());
                          }
                        },
                        child: Text("MY",style:TextStyle(fontSize: 15,color: appColorTextBlack ,fontWeight: FontWeight.w500),))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                Rounge(),
                Party(),
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
    );
  }
}
