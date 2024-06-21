import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/global/global.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/model/vo/appInfo_vo.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class NoticeAccordion extends StatefulWidget {
  final NoticeVo content;
  final bool defaultOpen;
  final VoidCallback onToggle;

  const NoticeAccordion(
      {Key? key,
        required this.content,
        required this.defaultOpen,
        required this.onToggle})
      : super(key: key);

  @override
  State<NoticeAccordion> createState() => _NoticeAccordionState();
}

class _NoticeAccordionState extends State<NoticeAccordion>
    with SingleTickerProviderStateMixin {
  // Show or hide the content

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
   
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    if (widget.defaultOpen) {
      _controller.forward();
    }
  }

  //다른 위젯의 아코디언을 열었을때 이미 열려있는 위젯을 닫는다.
  @override
  void didUpdateWidget(covariant NoticeAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.defaultOpen) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(milliseconds: 200));
    }
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(

        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.content!.title!,style: TextStyles.contents15_b,),
                        SizedBox(height: 10,),
                        Text(commonDate(widget.content.createDate!),style: TextStyles.contents12_g1,)
                      ],
                    )),
                    GestureDetector(
                      onTap: () {
                        widget.onToggle();
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(15.0),
                        child: _controller.status.index == 1
                            ? Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,))
                            : Transform.rotate(
                            angle: 270 * math.pi / 180,
                            child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,))
                      ),
                    ),
                  ],
                ),

                SizeTransition(
                    sizeFactor: _animation,
                    axis: Axis.vertical,
                    child: Container(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColorGray8),
                        color: appColorGray8.withOpacity(0.5)
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.content.title??""),
                          SizedBox(height: 10,),
                          Text(widget.content.contents??""),
                          if(widget.content.image!=null && widget.content.image!.length !=0)
                            Column(
                              children: [
                                SizedBox(height: 10,),
                                Container(

                                  height: 50,
                                  child: ListView.separated(
                                    itemCount: widget.content.image!.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 10,);
                                    },
                                    itemBuilder: (context, index) {
                                      return Image.network(widget.content.image![index]);
                                    },
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
