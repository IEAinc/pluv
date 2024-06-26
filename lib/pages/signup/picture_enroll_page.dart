import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderables/reorderables.dart';

import '../../component/custom_progress_indicator.dart';
import '../../component/rectangle_button.dart';
import '../../controller/auth_controller.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///PictureEnrollPage
///담당자 : ---

class PictureEnrollPage extends StatefulWidget {
  const PictureEnrollPage({Key? key}) : super(key: key);

  @override
  State<PictureEnrollPage> createState() => _PictureEnrollPageState();
}

class _PictureEnrollPageState extends State<PictureEnrollPage> {

  @override
  void initState() {
    super.initState();
    logger.i("PictureEnrollPage");
    _imageList = [...(authController.myInfo!.profileImageList!)];
    setState(() {
    });

  }

  List<dynamic> _imageList = [];
  bool _loading = false;



  Future<void> _addImage() async {
    XFile? file = await pickImage();
    if(_imageList.length<5){
      if (file != null) {
        setState(() {
          _imageList.add(File(file.path));
        });
      }
    }
  }

  Future<void> _editImage(int index) async {

    XFile? file = await pickImage();
    if (file != null) {
      setState(() {
        _imageList[index] = File(file.path);
      });
    }



  }



  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "사진"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("프로필 사진을 올려주세요.",style: TextStyles.title20_b,),
                  SizedBox(height: 10,),
                  Text("마스크, 선글라스등 얼굴을 가린 사진은 피해주세요.",style: TextStyles.contents14_g1,),
                  Text("최근과 가장 비슷한 현재의 보습으로 올려주세요!",style: TextStyles.contents14_g1,),
                  Text("이미 당신은 충분히 아름답고 멋있습니다.",style: TextStyles.contents14_g1,),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: appColorGray8)
                            ),
                            child:
                            (_imageList!.length == 0 )
                                ?GestureDetector(
                              onTap: (){
                                _addImage();
                              },
                              child: Container(
                                color: Colors.transparent,
                                  child: Center(child: Text("+",style: TextStyles.contents24_g1,))),
                                )
                                :GestureDetector(
                                onTap: (){
                                  _editImage(0);
                                },
                                child:  (_imageList[0] is String)?Image.network(_imageList[0],fit: BoxFit.cover,):Image.file(_imageList[0],fit: BoxFit.cover,),
                            ),


                          )),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          _picture_box(0),
                          SizedBox(width: 10,),
                          _picture_box(1),
                          SizedBox(width: 10,),
                          _picture_box(2),
                          SizedBox(width: 10,),
                          _picture_box(3),
                          SizedBox(width: 10,),
                          _picture_box(4),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  RectangleButton(name: "저장",mode: 1,action: () async{

                    setState(() {
                      _loading = true;
                    });
                    try{
                      logger.e(_imageList);
                      await authController.uploadProfileImage(_imageList);
                      Get.back();
                    }catch(e){
                      logger.e(e);
                    }
                    setState(() {
                      _loading = false;
                    });
                  },)
                ],
              ),
            ),
          ),
          if(_loading)
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white.withOpacity(0.5),
            child: Center(child: CustomProgressIndicator()),
          )
        ],
      ),
    );
  }

  Container _picture_box(int index) {
    return Container(
                      height: (Get.width-40-32)/5,
                      width: (Get.width-40-32)/5,
                      decoration: BoxDecoration(
                          border: Border.all(color: appColorGray8)
                      ),

                      child:  (_imageList!.length <= index )?GestureDetector(
                          onTap: (){
                            _addImage();
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: Center(child: Text("+",style: TextStyles.contents24_g1,))))
                          :GestureDetector(
                          onTap: (){
                            _editImage(index);
                          },
                          child: (_imageList[index] is String)?Image.network(_imageList[index],fit: BoxFit.cover,):Image.file(_imageList[index],fit: BoxFit.cover,)),
                    );
  }
}

