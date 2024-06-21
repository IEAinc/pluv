import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/notice_accordion.dart';
import 'package:pluv/controller/status_controller.dart';

import '../../global/global.dart';
import '../../model/vo/appInfo_vo.dart';

///NoticePage
///담당자 : ---

class NoticePage extends StatefulWidget {
  final String type;
  const NoticePage({Key? key, required this.type}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {

  @override
  void initState() {
    super.initState();
    logger.i("NoticePage & faq");

    setState(() {
      noticeList = _statusController.appInfo.noticeList!.where((notice) => notice.exposure == true && notice.type == widget.type).toList();
    });

  }

  int? _expandedIndex;
  List<NoticeVo> noticeList = [];
  void _toggleAccordion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        // 이미 열려있는 상태인 경우 닫음
        _expandedIndex = null;
      } else {
        // 다른 위젯을 닫고 선택한 위젯을 열음
        _expandedIndex = index;
      }
    });
  }

  StatusController _statusController = Get.find<StatusController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusController>(
      builder: (statusController) {
        return Scaffold(
          appBar: customAppBar(title: widget.type=="notice"?"공지사항":"자주 묻는 질문"),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: noticeList.length,
              itemBuilder: (context, index) {

                return NoticeAccordion(
                    defaultOpen:
                    _expandedIndex == index ? true : false,
                    content: noticeList[index],
                    onToggle: () => _toggleAccordion(index));
              },
            ),
          ),
        );
      }
    );
  }
}
