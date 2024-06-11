import 'package:flutter/material.dart';

import '../../global/global.dart';

///SignUpPage
///담당자 : ---

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  void initState() {
    super.initState();
    logger.i("SignUpPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUpPage"),),
      body: Text("SignUpPage"),
    );
  }
}

