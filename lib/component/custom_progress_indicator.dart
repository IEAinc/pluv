import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../global/global.dart';



///CustomProgressIndicator
///담당자 : saran

class CustomProgressIndicator extends StatefulWidget {
  final double? size;
  final String? imagePath;

  const CustomProgressIndicator({Key? key,this.size , this.imagePath}) : super(key: key);

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Lottie.asset(loadingProgress,width: 150,height: 150);
  }
}
