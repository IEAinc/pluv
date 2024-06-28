import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/pages/main/my_lounge_page.dart';
import 'package:pluv/pages/main/party_screen.dart';
import 'package:pluv/pages/main/lounge_screen.dart';
import 'package:pluv/pages/main/search_page.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';
import 'my_party_page.dart';

///CommunityScreen
///담당자 : ---

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;



  @override
  void initState() {
    super.initState();
    logger.i("CommunityScreen");
  }


  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);



  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Stack(
          children: [
            Container(
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
                            }, child: Text("Lounge",style:_currentIndex==0? TextStyles.title18_b:TextStyles.sub_title18_b,),),

                            Text("|"),
                            TextButton(
                                onPressed: (){
                                  setState(() {
                                    _currentIndex = 1;
                                  });
                                  _pageController.jumpToPage(1);
                                },
                                child: Text("Party",style:_currentIndex==1? TextStyle(fontSize: 18,color: appColorBlack ,fontWeight: FontWeight.w700):TextStyle(fontSize: 18,color: appColorGray1 ,fontWeight: FontWeight.w500),),),
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
                                child: Text("MY",style:TextStyles.sub_title15_b,))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: <Widget>[
                        LoungeScreen(),
                        PartyScreen(),
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
            if(authController.myInfo==null)
              Container(
                width: Get.width,
                color: appColorBlack.withOpacity(0.5),
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text("로그인 이후 이용해보세요",style: TextStyles.title16_w,),
                  ],
                ),
              ),
            if(authController.myInfo!=null && authController.myInfo!.memberStatus==1)
              Container(
                width: Get.width,
                color: appColorBlack.withOpacity(0.5),
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text("내 프로필을 입력하고,\n회원 심사요청을 눌러주세요.",style: TextStyles.title16_w)
                  ],
                ),
              ),
            if(authController.myInfo!=null && authController.myInfo!.memberStatus==2)
              Container(
                width: Get.width,
                color: appColorBlack.withOpacity(0.5),
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text("회원 심사중입니다.\n완료 후 이용해보세요.",style: TextStyles.title16_w)
                  ],
                ),
              ),
          ],
        );
      }
    );
  }
}
