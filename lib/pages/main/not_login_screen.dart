import 'package:flutter/material.dart';

import '../../global/global.dart';

///NotLoginScreen
///담당자 : ---

class NotLoginScreen extends StatefulWidget {
  const NotLoginScreen({Key? key}) : super(key: key);

  @override
  State<NotLoginScreen> createState() => _NotLoginScreenState();
}

class _NotLoginScreenState extends State<NotLoginScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("NotLoginScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("로그인 이후 이용해보세요")),
    );
  }
}
