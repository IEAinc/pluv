import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/data_controller.dart';
import 'package:pluv/model/vo/lounge_vo.dart';
import 'package:pluv/pages/main/lounge_write_page.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import 'custom_dialog.dart';

///LoungeEditDeleteBottomSheet
///담당자 : ---

class LoungeEditDeleteBottomSheet extends StatefulWidget {
  final LoungeVo item;
  const LoungeEditDeleteBottomSheet({Key? key , required this.item}) : super(key: key);

  @override
  State<LoungeEditDeleteBottomSheet> createState() => _LoungeEditDeleteBottomSheetState();
}

class _LoungeEditDeleteBottomSheetState extends State<LoungeEditDeleteBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeEditDeleteBottomSheet");
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
              Get.to(()=>LoungeWritePage(item: widget.item,));

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
                                  await dataController.removeLounge(widget.item.loungeKey!);
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
