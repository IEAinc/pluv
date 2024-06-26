import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluv/controller/auth_controller.dart';

import '../../component/rectangle_button.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';
import '../model/vo/member_vo.dart';

///PaperTemplate
///담당자 : ---

abstract class PaperTemplate<T extends StatefulWidget> extends State<T> {


  List<dynamic> imageList = []; // 직업 인증 자료


  void findImageList(String paperCode) {
    if (authController.myInfo!.paperInfo != null) {
      for (PaperInfoVo paperInfo in authController.myInfo!.paperInfo!) {
        if (paperInfo.paperCode == paperCode) {
          setState(() {
            imageList = paperInfo?.imageList??[];
          });
          break;
        }
      }
    }
  }

  Future<void> _addImage() async {
    XFile? file = await pickImage();
    if(this.imageList.length<5){
      if (file != null) {
        setState(() {
          this.imageList.add(File(file.path));
        });
      }
    }
  }
  Future<void> _editImage(int index) async {

    XFile? file = await pickImage();
    if (file != null) {
      setState(() {
        this.imageList[index] = File(file.path);
      });
    }

  }

  bool moreToggle = false;
  bool loading = false;
  AuthController authController = Get.find<AuthController>();

  Container picture_box(int index) {
    return Container(
      height: (Get.width-20-32)/3,
      width: (Get.width-20-32)/3,
      decoration: BoxDecoration(
          border: Border.all(color: appColorGray8)
      ),

      child:  (imageList!.length <= index )?GestureDetector(
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
          child: (this.imageList[index] is String)?Image.network(this.imageList[index],fit: BoxFit.cover,):Image.file(this.imageList[index],fit: BoxFit.cover,)),
    );
  }


}

