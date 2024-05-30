import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/global.dart';

///MyScreen
///담당자 : ---

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("MyScreen");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text("MyScreen"),
              Container(
                height: 600,
                width: 300,
                color: Colors.red,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
