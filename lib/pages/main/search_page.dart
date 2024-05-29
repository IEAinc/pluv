import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///SearchPage
///담당자 : ---

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    super.initState();
    logger.i("SearchPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("제목을 검색해주세요!",style: TextStyles.title1,),

          ],
        ),
      ),
    );
  }


}
