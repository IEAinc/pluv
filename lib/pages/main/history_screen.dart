import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/pages/main/matching_success_screen.dart';
import 'package:pluv/pages/main/not_login_screen.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';
import 'last_recommend_screen.dart';
import 'matching_progress_screen.dart';

///HistoryScreen
///담당자 : ---

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

int _currentIndex = 0;
final PageController _pageController = PageController(initialPage: 0);



class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("HistoryScreen");
  }

  List<String> menu = ['지난 추천','진행중','매칭됨'];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child:authController.myInfo==null?NotLoginScreen(): Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              ...List.generate(menu.length, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            _currentIndex=index;
                          });
                          _pageController.jumpToPage(index);
                        },
                        child: Center(
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color:_currentIndex==index? appColorPrimary2:Colors.transparent,width: 3))
                            ),
                            child: Center(child: Text(menu[index],style:_currentIndex==index?TextStyles.title15_b.copyWith(color: appColorPrimary2): TextStyles.sub_title15_g1,)),
                          ),
                        ),
                      ),
                    );
          }),


                ],
              ),
              Divider(height: 1,),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    LastRecommendScreen(),
                    MatchingProgressScreen(),
                    MatchingSuccessScreen(),


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
    );
  }
}
