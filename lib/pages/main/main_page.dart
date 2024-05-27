import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/status_controller.dart';
import '../../global.dart';

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
                appBar: AppBar(toolbarHeight: 0,),
                body: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Text("S"),
                    Text("S"),
                    Text("S"),
                    Text("S"),
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
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/icon/home_icon.svg'),
                        activeIcon:
                        SvgPicture.asset('assets/images/icon/home_icon_focus.svg'),
                        label: 'Section A'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/icon/heart_icon.svg'),
                        label: 'Section B'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/icon/document_icon.svg'),
                        activeIcon: SvgPicture.asset(
                            'assets/images/icon/document_icon_focus.svg'),
                        label: 'Section C'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/icon/party_icon.svg'),
                        activeIcon:
                        SvgPicture.asset('assets/images/icon/party_icon_focus.svg'),
                        label: 'Section D'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/images/icon/account_icon.svg'),
                        activeIcon: SvgPicture.asset(
                            'assets/images/icon/account_icon_focus.svg'),
                        label: 'Section E'),


                  ],
                )
            ),
          );
        }
    );
  }
}

