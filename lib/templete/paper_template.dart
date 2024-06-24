import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../component/rectangle_button.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///PaperTemplate
///담당자 : ---

abstract class PaperTemplate<T extends StatefulWidget> extends State<T> {

  List<dynamic> _imageList = []; // 직업 인증 자료


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

  bool moreToggle = false;

  Container picture_box(int index) {
    return Container(
      height: (Get.width-20-32)/3,
      width: (Get.width-20-32)/3,
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

