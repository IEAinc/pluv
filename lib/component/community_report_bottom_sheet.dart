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

class CommunityReportBottomSheet extends StatefulWidget {

  final String communityKey;
  final int communityType;
  CommunityReportBottomSheet({Key? key ,required this.communityKey , required this.communityType}) : super(key: key);

  @override
  _CommunityReportBottomSheetState createState() => _CommunityReportBottomSheetState();


}

class _CommunityReportBottomSheetState extends State<CommunityReportBottomSheet> {
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
          // padding: EdgeInsets.symmetric(horizontal: 16),
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
                  Text("게시글 신고")
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

                      CommunityReportVo communityReportVo = CommunityReportVo();

                      communityReportVo.reportedCommunityKey = widget.communityKey;
                      communityReportVo.communityType = widget.communityType;
                      communityReportVo.reporterUid = authController.myInfo!.memberUid;
                      communityReportVo.communityReportCode = _reportCode;
                      communityReportVo.detailedReport = _detailedReport?.text??"";
                      communityReportVo.reportStatus = 1;
                      await dataController.reportCommunity(communityReportVo);
                      Get.back();
                      getCommonSnackbar("신고완료", "해당 게시물을 신고하였습니다.");
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