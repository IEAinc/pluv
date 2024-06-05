import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/model/vo/lounge_vo.dart';

import '../../controller/auth_controller.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';
import '../../model/dto/lounge_dto.dart';
import '../../model/vo/comment_vo.dart';

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

  DataController _dataController = Get.find<DataController>();
  AuthController _authController = Get.find<AuthController>();
  List<LoungeDto>? items;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusController>(
      builder: (controller) {
        return Container(
          child: Column(
            children: [
              GestureDetector(

                  onTap: () async{
                    logger.e(controller.appInfo.toJson());

                    setState(() {});
                  },
                  child:Text("SD")

              ),
              (items==null || items!.length==0)?Container(): Expanded(
                child: ListView.separated(
                  itemCount: items!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Text("SD"),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10,);
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
