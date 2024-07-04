import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/comment_bottom_sheet.dart';
import 'package:pluv/component/signup_bottom_sheet.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/model/vo/member_vo.dart';
import 'package:pluv/sample_page.dart';

import '../global/global.dart';
import '../global/text_styles.dart';
import '../model/vo/comment_vo.dart';
import 'comment_report_bottom_sheet.dart';
import 'dot.dart';
import 'dart:math' as math;
///CommentCard
///담당자 : ---

class CommentCard extends StatefulWidget {
  final CommentVo item;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool? hideUnderCommentCount;
  const CommentCard({Key? key ,required this.item , this.backgroundColor , this.padding, this.hideUnderCommentCount}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {

  @override
  void initState() {
    super.initState();

  }

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,height: 24,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:widget.item!.writerGender! ?appColorPrimary2:appColorRed2),
                    child: Center(child: Text(widget.item!.writerGender! ?"남":"여",style: TextStyles.sub_title12_w,)),
                  ),
                  SizedBox(width: 5,),
                  Text("익명"),
                  Dot(),
                  Text(timeAgo(widget.item.commentCreateDate!.toDate()),style: TextStyles.sub_title12_g1,),
                ],
              ),
              GestureDetector(
                  onTap: (){
                    if(authController.myInfo!.memberUid == widget.item!.writerUid!){
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CommentReportBottomSheet(
                            item: widget.item,
                          );
                        },
                      );
                    }else{
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CommentReportBottomSheet(
                            item: widget.item,
                          );
                        },
                      );
                    }
                  },
                  child: SvgPicture.asset('assets/images/myicon/dot.svg',height: 15,)),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: GestureDetector(
                  onTap: (){

                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return CommentBottomSheet(item: widget.item);
                      },
                    ).whenComplete((){
                        Timer(Duration(milliseconds: 100), () {
                          FocusScope.of(context).unfocus();
                        });
                    });
                  },
                  child: Text(widget.item.commentDescription! , maxLines: 3, overflow: TextOverflow.ellipsis,))),
              SizedBox(width: 10,),
            ],
          ),

          if(widget.item.underCommentList!.length>0 && widget.hideUnderCommentCount != true)
            Column(
              children: [
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return CommentBottomSheet(item: widget.item);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text("답글 ${widget.item.underCommentList!.length}개" ,style: TextStyles.sub_title12_b,),
                    ],
                  ),
                ),
              ],
            ),


        ],
      ),
    );
  }
}
