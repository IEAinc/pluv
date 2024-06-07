import 'package:flutter/material.dart';

import '../../global/global.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlarmSettingPage"),),
      body: Text("AlarmSettingPage"),
    );
  }
}
