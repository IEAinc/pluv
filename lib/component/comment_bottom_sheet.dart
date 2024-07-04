import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/comment_card.dart';
import 'package:pluv/component/custom_progress_indicator.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/model/vo/member_vo.dart';
import 'package:pluv/pages/system/terms_page.dart';


import '../controller/auth_controller.dart';
import '../controller/data_controller.dart';
import '../global/global.dart';
import '../global/text_styles.dart';
import '../model/vo/comment_vo.dart';
import '../pages/main/main_page.dart';
import '../pages/system/term_detail_page.dart';
import 'custom_input_filed.dart';
import 'dot.dart';

///CommentBottomSheet
///담당자 : ---

class CommentBottomSheet extends StatefulWidget {
  CommentVo item;
  CommentBottomSheet({Key? key ,required this.item}) : super(key: key);

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {

  @override
  void initState() {
    super.initState();
    logger.i("CommentBottomSheet");
    getCommentList();
  }



  AuthController authController = Get.find<AuthController>();
  StatusController statusController = Get.find<StatusController>();
  DataController dataController = Get.find<DataController>();

  final FocusNode _focusNode = FocusNode();
  Future<void> getCommentList() async{
    logger.e("SD");
    setState(() {
      _commentLoading = true;
    });
    try{
      Map<String,dynamic> result = await dataController.getCommentList(widget.item.targetCommunityKey!,widget.item.commentKey!,2, _lastComment);
      _commentList = result['commentList']??[];
      _lastComment = result['lastDocument'];

    }catch(e){
      logger.e(e);
    }
    setState(() {
      _commentLoading = false;
    });
  }

  List<CommentVo>? _commentList;
  DocumentSnapshot? _lastComment;
  bool _commentLoading= false;

  TextEditingController _commentController =  TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    _commentController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        bottom: true,
        top: false,
        child: Stack(
          children: [
            Container(
                height: Get.height/1.8+Get.mediaQuery.viewInsets.bottom/2,
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CommentCard(
                              item: widget.item,
                              backgroundColor: appColorGray8.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                              hideUnderCommentCount: true,
                            ),

                            _commentList==null
                                ?CustomProgressIndicator()
                                :_commentList!.length==0?Container(child: Text(""),): ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _commentList!.length,

                              itemBuilder: (context, index) {
                                return CommentCard(item: _commentList![index],padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16).copyWith(left: 36),);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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
                                    focusNode: _focusNode,
                                    labelText: "대댓글 작성",
                                    controller: _commentController,
                                    fillColor: Color(0xFFf9f9f9),
                                    keyboardType: TextInputType.multiline,
                                    borderRadius: 5,

                                    contentsPaddingVertical: 10,
                                    maxLine: _focusNode.hasFocus?3:1,
                                    minLines: 1,
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
                                if(_focusNode.hasFocus)
                                  GestureDetector(
                                      onTap: () async {
                                        try{
                                          CommentVo newComment = CommentVo();
                                          newComment.targetCommunityKey = widget.item.targetCommunityKey;
                                          newComment.upperReplyKey = widget.item.commentKey;
                                          newComment.replyDepth = 2;
                                          newComment.writerUid = authController.myInfo!.memberUid;
                                          newComment.writerGender = authController.myInfo!.memberGender;
                                          newComment.commentDescription = _commentController.text;
                                          newComment.commentStatus = 1;
                                          await dataController.addComment(newComment);
                                          _lastComment = null;
                                          await getCommentList();
                                        }catch(e){
                                          logger.e(e);
                                        }
                                        _commentController.clear();
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Icon(Icons.send))
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.mediaQuery.viewInsets.bottom,
                    )


                  ],
                )
            ),

          ],
        ),
      ),
    );
  }



}
