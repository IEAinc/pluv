import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/data_controller.dart';
import 'package:pluv/pages/main/comment_edit_page.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import '../model/vo/comment_vo.dart';
import 'custom_dialog.dart';

///CommentEditDeleteBottomSheet
///담당자 : ---

class CommentEditDeleteBottomSheet extends StatefulWidget {
  final CommentVo item;

  const CommentEditDeleteBottomSheet({Key? key , required this.item }) : super(key: key);

  @override
  State<CommentEditDeleteBottomSheet> createState() => _CommentEditDeleteBottomSheetState();
}

class _CommentEditDeleteBottomSheetState extends State<CommentEditDeleteBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("CommentEditDeleteBottomSheet");
  }

  DataController dataController =Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('댓글 수정'),
            onTap: () {
              // Edit post logic here
              Get.to(()=>CommentEditPage(item: widget.item))?.then((d){
                setState(() {

                });
              });

            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('댓글 삭제'),
            onTap: () {

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: 20,),
                      Text("해당 댓글을 삭제할까요?",style: TextStyles.title22_b,),


                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: RectangleButton(
                                action: (){

                                  Get.back();
                                },
                                name: "취소"),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: RectangleButton(
                              action: () async{

                                try{
                                  await dataController.removeComment(widget.item.commentKey!);
                                  Get.until((route) => Get.currentRoute == '/');
                                  getCommonSnackbar("댓글삭제", "해당 댓글을 삭제하였습니다.");
                                }catch(e){

                                  logger.e(e);
                                  getCautionSnackbar("삭제 실패하였습니다");
                                }




                              },
                              name: "네, 삭제합니다.",mode: 1,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  )
                  );
                },
              );


              // Delete post logic here
              // Get.back();
            },
          ),
        ],
      ),
    );
  }
}
