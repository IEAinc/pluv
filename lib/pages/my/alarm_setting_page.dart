import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';


///AlarmSettingPage
///담당자 : ---

class AlarmSettingPage extends StatefulWidget {
  const AlarmSettingPage({Key? key}) : super(key: key);

  @override
  State<AlarmSettingPage> createState() => _AlarmSettingPageState();
}

class _AlarmSettingPageState extends State<AlarmSettingPage> {

  @override
  void initState() {
    super.initState();
    logger.i("AlarmSettingPage");
  }

  bool pushEntire = false;
  Map<String,bool> alarmCode ={
    "SY_AR_01":true, // 매칭성공알람
    "SY_AR_02":true, // 좋아요획득알람
    "SY_AR_03":true, // 슈퍼좋아요획득알람
    "SY_AR_04":true, // 파티초대받음알람
    "SY_AR_05":true, // 파티초대권받은사람수락알람
    "SY_AR_06":true, // 파티매칭성공알람
    "SY_AR_07":true, // 라운지댓글달림알람
    "SY_AR_08":true, // 상위평가알람
    "SY_AR_09":true, // 매칭추천도착알람
    "SY_AR_10":true, // 공지사항
    "SY_AR_11":true, // 이벤트
    "SY_AR_12":true, // 마케팅
  };

  void updatePushEntire() {
    setState(() {
      pushEntire = alarmCode.values.every((value) => value == true);
    });
  }

  void togglePushEntire() {
    setState(() {
      if (!pushEntire) {
        alarmCode.updateAll((key, value) => true);
        pushEntire = true;
      } else {
        alarmCode.updateAll((key, value) => false);
        pushEntire = false;
      }
    });
  }

  String findCode(String code){
    return _statusController.appInfo.alarmCode?[code]??code;
  }

  StatusController _statusController = Get.find<StatusController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "알람설정"),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("앱 PUSH 알람",style: TextStyles.title18_b,),
                      Row(
                        children: [
                          Text("전체"),
                          SizedBox(width: 10,),
                          FlutterSwitch(
                            value: pushEntire,
                            width: 46,
                            height: 24,
                            toggleSize: 22,
                            padding: 1,
                            inactiveColor: appColorGray8,
                            activeColor: appColorPrimary2,
                            onToggle: (val) {
                              togglePushEntire();
                            },
                          )
        
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  ...alarmCode.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(findCode(entry.key),style: TextStyles.sub_title15_b,),
                          FlutterSwitch(
                            value: entry.value,
                            width: 46,
                            height: 24,
                            toggleSize: 22,
                            padding: 1,
                            inactiveColor: appColorGray8,
                            activeColor: appColorPrimary2,
                            onToggle: (newValue) {
                              setState(() {
                                alarmCode[entry.key] = newValue;
                                updatePushEntire();
                              });


                            },
                          )
                        ],
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}


