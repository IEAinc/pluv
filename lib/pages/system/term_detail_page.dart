import 'package:flutter/material.dart';
import 'package:pluv/global/text_styles.dart';

import '../../global/global.dart';

///TermDetailPage
///담당자 : ---

class TermDetailPage extends StatefulWidget {
  final term;

  const TermDetailPage({Key? key , required this.term}) : super(key: key);

  @override
  State<TermDetailPage> createState() => _TermDetailPageState();
}

class _TermDetailPageState extends State<TermDetailPage> {

  @override
  void initState() {
    super.initState();
    logger.i("TermDetailPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: widget.term),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(widget.term,style: TextStyles.title24_b,),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
