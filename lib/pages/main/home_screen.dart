import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///HomeScreen
///담당자 : ---

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("HomeScreen");
    _scrollControllerGrid.addListener(_onScrollGrid);
    _scrollControllerPage.addListener(_onScrollPageDirection);
  }

  ScrollController _scrollControllerGrid = ScrollController();
  ScrollController _scrollControllerPage = ScrollController();
  bool gridScrollAble = true;
  void _onScrollGrid() {

    if (_scrollControllerGrid.position.atEdge) {
      if (_scrollControllerGrid.position.pixels == 0) {
        setState(() {
          gridScrollAble = false;
        });
      }else{
        setState(() {
          gridScrollAble = true;
        });
      }
    }
  }

  void _onScrollPageDirection() {
    if (_scrollControllerPage.offset > _lastOffset) {
    } else if (_scrollControllerPage.offset < _lastOffset) {
      // 스크롤이 위로 이동
      setState(() {
        gridScrollAble = true;
      });
    }
    _lastOffset = _scrollControllerPage.offset;
  }

  double _lastOffset = 0;

  @override
  void dispose() {
    _scrollControllerGrid.removeListener(_onScrollGrid);
    _scrollControllerGrid.dispose();
    _scrollControllerPage.removeListener(_onScrollPageDirection);
    _scrollControllerPage.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return SingleChildScrollView(
          controller: _scrollControllerPage,
          physics: ClampingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("오늘의 카드" , style: TextStyles.title20_b,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: Get.height/2,
                      child: GridView.builder(
                        controller: _scrollControllerGrid,
                        physics: gridScrollAble?ClampingScrollPhysics():NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 그리드 열 수
                            childAspectRatio: 3/4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          // index에 따라 각 아이템을 생성
                          return GestureDetector(
                            onTap: (){
                              setState(() {

                              });
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                                child: Image.network(
                                  'https://cdn.pixabay.com/photo/2023/01/03/16/00/dog-7694676_1280.jpg',
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                    return Container(
                                      color: appColorGray1,

                                    );
                                  },
                                )
                            ),
                          ); //
                        },
                        itemCount: 6, //
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("나에게 꼭 맞는\n이상형을 찾아드려요!" , style: TextStyles.title20_b,),
                        Text("더보기  >" , style: TextStyles.sub_title14_b.copyWith(color: appColorGray2),),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20 ),
                            height: 82,
                            width: Get.width,
                          decoration: BoxDecoration(
                              color: appColorGray2.withOpacity(0.25),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/icon/medal.svg',),
                              SizedBox(width: 10,),
                              Text("프로톡 상위 4% 이성 만나기",style: TextStyles.sub_title16_b,),
                              SizedBox(width: 10,),
                              SvgPicture.asset('assets/images/icon/hot.svg',),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20 ),
                          height: 82,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: appColorGray2.withOpacity(0.25),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/icon/medal.svg',),
                              SizedBox(width: 10,),
                              Text("프로톡 상위 4% 이성 만나기",style: TextStyles.sub_title16_b,),
                              SizedBox(width: 10,),
                              SvgPicture.asset('assets/images/icon/hot.svg',),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    )
                  ],
                ),
              ),
              if(authController.myInfo==null)
              Container(
                width: 10000,
                height: 1000,
                color: appColorBlack.withOpacity(0.5),
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text("로그인 이후 이용해보세요",style: TextStyles.title16_w,),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

