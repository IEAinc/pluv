import 'package:flutter/material.dart';

import 'global/global.dart';

///SamplePage
///담당자 : ---

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {

  @override
  void initState() {
    super.initState();
    logger.i("SamplePage");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SamplePage"),),
      body: Text("SamplePage"),
    );
  }
}
