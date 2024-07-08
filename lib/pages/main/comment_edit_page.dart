import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';

import '../../component/custom_input_filed.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';
import '../../model/vo/comment_vo.dart';

///CommentEditPage
///담당자 : ---

class CommentEditPage extends StatefulWidget {
  final CommentVo item;
  const CommentEditPage({Key? key, required this.item}) : super(key: key);

  @override
  State<CommentEditPage> createState() => _CommentEditPageState();
}

class _CommentEditPageState extends State<CommentEditPage> {

  @override
  void initState() {
    super.initState();
    logger.i("CommentEditPage");
    commentController.text = widget.item!.commentDescription??"";
  }

  TextEditingController commentController =  TextEditingController();
  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(title: "댓글수정"),
        body: Column(
          children: [
            Container(
              width: Get.width,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: appColorGray1),
                        )),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: CustomInputFiled(

                            controller: commentController,
                            fillColor: Color(0xFFf9f9f9),
                            keyboardType: TextInputType.multiline,
                            borderRadius: 5,

                            contentsPaddingVertical: 10,
                            maxLine: 5,
                            minLines: 5,
                            isDense: true,
                            onChanged: (val) {
                              setState(() {
                                // comment = val;
                              });
                            },
                            suffix: false,
                          ),
                        ),

                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: RectangleButton(name: "댓글 수정",mode: 1,action: () async{

                if(widget.item.commentDescription == commentController.text){
                  Get.back();
                }else{
                  try{
                    await dataController.updateComment(widget.item,commentController.text);
                    widget.item.commentDescription =commentController.text;
                    widget.item.commentUpdateDate =Timestamp.now();
                    Get.back();
                  }catch(e){
                    logger.e(e);
                    Get.back();
                    getCautionSnackbar("댓글 수정 실패");
                  }
                }


              },),
            )
          ],
        ),
      ),
    );
  }
}
