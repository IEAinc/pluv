import 'package:flutter/material.dart';

import '../../global/global.dart';

///ProfileEditPage
///담당자 : ---

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {

  @override
  void initState() {
    super.initState();
    logger.i("ProfileEditPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Text("ProfileEditPage"),
    );
  }
}
