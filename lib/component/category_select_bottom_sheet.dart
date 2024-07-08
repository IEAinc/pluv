
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../global/global.dart';


///CategorySelectBottomSheet
///담당자 : ---

class CategorySelectBottomSheet extends StatefulWidget {

  CategorySelectBottomSheet({Key? key }) : super(key: key);

  @override
  State<CategorySelectBottomSheet> createState() => _CategorySelectBottomSheetState();
}

class _CategorySelectBottomSheetState extends State<CategorySelectBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("CategorySelectBottomSheet");

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
          height: Get.height/1.8,
          width: Get.width,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: appColorWhite
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(height: 50, padding: EdgeInsets.symmetric(horizontal: 16),child: Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset('assets/images/myicon/arrowleft.svg',width: 12,height: 12,)),
                  SizedBox(width: 10,),
                  Text("대댓글")
                ],
              )),




            ],
          )
      ),
    );
  }



}
