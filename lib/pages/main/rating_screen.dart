import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/status_controller.dart';

import '../../global/global.dart';

///RatingScreen
///담당자 : ---

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("RatingScreen");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("RatingScreen"),),
          body: GestureDetector(

              onTap: (){
                logger.e(controller.appInfo.toJson());

              },
              child: Text("RatingScreen")),
        );
      }
    );
  }
}
