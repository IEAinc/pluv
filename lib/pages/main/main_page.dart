import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/pages/main/community_screen.dart';
import 'package:pluv/pages/main/my_screen.dart';
import 'package:pluv/pages/main/rating_screen.dart';
import 'package:pluv/pages/my/alarm_list_page.dart';
import 'package:pluv/text_logo.dart';

import '../../controller/status_controller.dart';
import '../../global/global.dart';
import 'history_screen.dart';
import 'home_screen.dart';

///MainPage
///담당자 : ---

class MainPage extends StatefulWidget {
  final int initialPage;
  const MainPage({Key? key, required this.initialPage}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    logger.w("MainPage");

    setState(() {
      _currentIndex = widget.initialPage;
      _pageController = PageController(initialPage: widget.initialPage);
    });
  }
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusController>(
        builder: (statusController) {
          return SafeArea(
            bottom: false,
            top: false,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 52,
                  elevation: 50,
                  title: TextLogo(),
                  centerTitle: false,
                  actions: [
                    IconButton(
                      icon: SvgPicture.asset('assets/images/icon/alarm_ico.svg'),
                      onPressed: () {
                        Get.to(()=>AlarmListPage());
                      },
                    ),

                  ],
                ),
                body: PageView(

                  controller: _pageController,
                  children: <Widget>[
                    HomeScreen(),
                    RatingScreen(),
                    HistoryScreen(),
                    CommunityScreen(),
                    MyScreen()

                  ],
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,

                  onTap: (index) {
                    // 탭이 선택되면 해당 페이지로 이동
                    _pageController.jumpToPage(index);
                  },

                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [

                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/home.svg',colorFilter: ColorFilter.mode(_currentIndex ==0 ?appColorBlack :appColorGray4, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/heart.svg',colorFilter: ColorFilter.mode(_currentIndex ==1 ?appColorBlack :appColorGray4, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/document.svg',colorFilter: ColorFilter.mode(_currentIndex ==2 ?appColorBlack :appColorGray4, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/rounge.svg',colorFilter: ColorFilter.mode(_currentIndex ==3 ?appColorBlack :appColorGray4, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/man.svg',colorFilter: ColorFilter.mode(_currentIndex ==4 ?appColorBlack :appColorGray4, BlendMode.srcIn)),
                        label: ''
                    ),

                  ],
                )
            ),
          );
        }
    );
  }
}

