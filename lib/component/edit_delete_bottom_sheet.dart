import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/data_controller.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import 'custom_dialog.dart';

///EditDeleteBottomSheet
///담당자 : ---

class EditDeleteBottomSheet extends StatefulWidget {
  final String loungeKey;
  const EditDeleteBottomSheet({Key? key , required this.loungeKey}) : super(key: key);

  @override
  State<EditDeleteBottomSheet> createState() => _EditDeleteBottomSheetState();
}

class _EditDeleteBottomSheetState extends State<EditDeleteBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("EditDeleteBottomSheet");
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
            title: Text('게시글 수정'),
            onTap: () {
              // Edit post logic here
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('게시글 삭제'),
            onTap: () {

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: 20,),
                      Text("해당 게시물을 삭제할까요?",style: TextStyles.title22_b,),

                      SizedBox(height: 20,),
                      Text("게시물 삭제시 복구할수없어요",style: TextStyles.sub_title14_b,textAlign: TextAlign.center,),


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
                                  await dataController.removeLounge(widget.loungeKey);
                                }catch(e){

                                }

                                Get.back();
                                Get.back();
                                Get.back();

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
