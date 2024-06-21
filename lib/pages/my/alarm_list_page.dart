import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///AlarmListPage
///담당자 : ---

class AlarmListPage extends StatefulWidget {
  const AlarmListPage({Key? key}) : super(key: key);

  @override
  State<AlarmListPage> createState() => _AlarmListPageState();
}

class _AlarmListPageState extends State<AlarmListPage> {

  @override
  void initState() {
    super.initState();
    logger.i("AlarmListPage");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          appBar: customAppBar(title: "알림"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:authController.myInfo==null?Center(child: Text("로그인 이후 이용해보세요")): ListView.separated(
              itemCount: 100,
              itemBuilder: (context, index) {

                return Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text("누군가 나를 높게 평가했어요. \n지금확인해보세요!!")),
                      Expanded(
                          flex: 1,
                          child: Text("3시간 전",textAlign: TextAlign.end,style: TextStyles.contents15_g1,))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10,);
              },
            ),
          ),
        );
      }
    );
  }
}
