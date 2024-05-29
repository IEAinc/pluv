import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluv/pages/main/community.dart';
import 'package:pluv/text_logo.dart';

import '../../controller/status_controller.dart';
import '../../global/global.dart';
import 'home.dart';

///MainPage
///담당자 : ---

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    logger.w("MainPage");

  }
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
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
                      onPressed: () {},
                    ),

                  ],
                ),
                body: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Home(),
                    Text("S"),
                    Text("S"),
                    Community(),
                    Text("S"),

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
                    // BottomNavigationBarItem(
                    //     icon: SvgPicture.asset('assets/images/icon/free.svg',color: Colors.red,),
                    //     activeIcon:
                    //     SvgPicture.asset('assets/images/icon/home_icon_focus.svg'),
                    //     label: 'Section A'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/home.svg',colorFilter: ColorFilter.mode(_currentIndex ==0 ?appColorTextBlack :appColorGray, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/heart.svg',colorFilter: ColorFilter.mode(_currentIndex ==1 ?appColorTextBlack :appColorGray, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/document.svg',colorFilter: ColorFilter.mode(_currentIndex ==2 ?appColorTextBlack :appColorGray, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/rounge.svg',colorFilter: ColorFilter.mode(_currentIndex ==3 ?appColorTextBlack :appColorGray, BlendMode.srcIn)),
                        label: ''
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/myicon/man.svg',colorFilter: ColorFilter.mode(_currentIndex ==4 ?appColorTextBlack :appColorGray, BlendMode.srcIn)),
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

