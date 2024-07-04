import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/custom_input_filed.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/global.dart';
import 'package:pluv/model/vo/community_report_vo.dart';

import '../controller/data_controller.dart';
import '../model/vo/comment_report_vo.dart';
import '../model/vo/comment_vo.dart';

class CommentReportBottomSheet extends StatefulWidget {

  final CommentVo item;

  CommentReportBottomSheet({Key? key ,required this.item }) : super(key: key);

  @override
  _CommentReportBottomSheetState createState() => _CommentReportBottomSheetState();


}

class _CommentReportBottomSheetState extends State<CommentReportBottomSheet> {
  String? _reportCode;
  final TextEditingController _detailedReport = TextEditingController();


  StatusController statusController = Get.find<StatusController>();
  DataController dataController = Get.find<DataController>();
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        bottom: true,
        child: Container(
          color: appColorWhite,
          height: Get.height/2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,)),
                      SizedBox(width: 10,),
                      Text("댓글 신고")
                    ],
                  )),
              Expanded(
                  child: ListView.builder(
                    itemCount: statusController.appInfo.reportCode?.length??0,
                    itemBuilder: (context, index) {
                      return RadioListTile<String>(
                        title: Text(statusController.appInfo.reportCode![index].title!),
                        dense: true,
                        value: statusController.appInfo.reportCode![index].code!,
                        groupValue: _reportCode,
                        onChanged: (value) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            _reportCode = value;
                          });
                        },
                      );
                    },
                  )
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomInputFiled(

                  labelText: " 상세 신고 사유를 작성해 주세요.",

                  controller: _detailedReport,
                  fillColor: appColorGray8.withOpacity(0.5),
                  keyboardType: TextInputType.multiline,
                  borderRadius: 1,
                  contentsPaddingVertical: 1,
                  contentsPaddingHorizontal: 1,
                  maxLine: 3,
                  minLines: 3,
                  isDense: true,
                  onChanged: (val) {
                    setState(() {

                    });
                  },
                  suffix: false,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RectangleButton(name: "신고하기", mode: 1,action: () async{
                  if(_reportCode==null){
                    getCautionSnackbar("신고 사유를 선택해주세요");
                  }else{
                    try{
                      CommentReportVo commentReportVo = CommentReportVo();
                      commentReportVo.reportedCommentUid = widget.item.commentKey; // 신고된댓글uid
                      commentReportVo.reporterUid = authController.myInfo!.memberUid; // 신고자uid
                      commentReportVo.reportedCommentWriterUid = widget.item.writerUid; // 신고댓글작성자uid
                      commentReportVo.rootPostKey = widget.item.targetCommunityKey; // 루트게시글key
                      commentReportVo.reportCode = _reportCode; // 댓글신고코드
                      commentReportVo.detailedReport = _detailedReport?.text??""; // 상세신고내역
                      await dataController.reportComment(commentReportVo);
                      Get.back();
                      getCommonSnackbar("신고완료", "해당 댓글을 신고하였습니다.");
                    }catch(e){
                      logger.e(e);
                    }

                  }

                },),
              ),

            ],
          ),
        ),
      ),
    );
  }
}