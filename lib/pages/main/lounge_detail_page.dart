import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pluv/component/rectangle_button.dart';
import 'package:pluv/component/view_status.dart';
import 'package:pluv/controller/auth_controller.dart';
import 'package:pluv/controller/data_controller.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/model/vo/lounge_vo.dart';
import 'package:pluv/pages/main/lounge_text_detail_page.dart';

import '../../component/category_tag.dart';
import '../../component/custom_input_filed.dart';
import '../../component/custom_progress_indicator.dart';
import '../../global/global.dart';
import '../../global/text_styles.dart';

///LoungeDetailPage
///담당자 : ---

class LoungeDetailPage extends StatefulWidget {
  final String loungeKey;
  const LoungeDetailPage({Key? key, required this.loungeKey}) : super(key: key);

  @override
  State<LoungeDetailPage> createState() => _LoungeDetailPageState();
}

class _LoungeDetailPageState extends State<LoungeDetailPage> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeDetailPage");
    getItem();
  }

  void getItem() async{
    try{
      item = await dataController.getLounge(widget.loungeKey);
    }catch(e){
      Get.back();
    }
    setState(() {});
  }

  final FocusNode _focusNode = FocusNode();

  TextEditingController commentController =  TextEditingController();
  DataController dataController = Get.find<DataController>();
  StatusController statusController = Get.find<StatusController>();

  LoungeVo? item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();

        },
        child:GetBuilder<AuthController>(
          builder: (authController) {
            return Scaffold(
              appBar: customAppBar(
                  title: "자세히보기" ,
                  actions: [
                    SvgPicture.asset('assets/images/myicon/dot.svg',height: 15,),
                    SizedBox(width: 15  ,)]),
              body: item ==null ?Container(
                width: Get.width,
                height: Get.height,
                color: Colors.white.withOpacity(0.5),
                child: Center(child: CustomProgressIndicator()),
              ):Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),

                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CategoryTag(text: statusController.findTitleByCode(statusController.appInfo.loungeCategoryCode!, item!.loungeCategoryCode!)),
                                      Text('${item!.loungeTitle}',style: TextStyles.sub_title16_b,overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ViewStatus(
                                              gender :item?.writerGender??false,
                                              time:item?.loungeCreateDate??Timestamp.now(),
                                              viewCount : item?.viewCount??0,
                                              commentCount: item!.commentList!.length + item!.comment2List!.length
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider(height: 40,),
                                Container(
                                    height: Get.height/3,
                                    child: SingleChildScrollView(
                                      physics: ClampingScrollPhysics(),
                                      child: Column(
                                        children: [

                                          //텍스트영역
                                          GestureDetector(
                                            onTap: (){
                                              Get.to(()=>LoungeTextDetailPage(item: item!));
                                            },
                                            child: Container(
                                                constraints: BoxConstraints(maxHeight: Get.height/3/2),
                                                child: Text(item!.loungeDescription!,style: TextStyles.contents15_b,)),
                                          ),
                                          SizedBox(height: 10,),
                                          //만약이미지가 있다면
                                          if(item!.loungeImageList!.length>0)
                                          Container(
                                            constraints: BoxConstraints(maxHeight: Get.height/2),
                                            child: PageView.builder(
                                              itemCount: item!.loungeImageList!.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          contentPadding: EdgeInsets.zero,
                                                          backgroundColor: Colors.black,
                                                          insetPadding: EdgeInsets.zero,
                                                          content: SizedBox(
                                                            width: Get.width,
                                                            height: Get.width,
                                                            child: InteractiveViewer(
                                                              maxScale: 10,

                                                              child: ExtendedImage.network(
                                                                item!.loungeImageList![index] ?? "",
                                                                fit: BoxFit.contain,
                                                                cache: true,
                                                                initGestureConfigHandler: (state) {
                                                                  return GestureConfig(
                                                                    minScale: 0.9,
                                                                    animationMinScale: 0.7,
                                                                    maxScale: 3.0,
                                                                    animationMaxScale: 3.5,
                                                                    speed: 1.0,
                                                                    inertialSpeed: 100.0,
                                                                    initialScale: 1.0,
                                                                    inPageView: false,
                                                                    initialAlignment: InitialAlignment.center,
                                                                  );
                                                                },
                                                                loadStateChanged: (ExtendedImageState state) {
                                                                  if (state.extendedImageLoadState ==
                                                                      LoadState.failed) {
                                                                    return Image.asset(
                                                                      logoPath,
                                                                      fit: BoxFit.cover,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },

                                                  child: ExtendedImage.network(
                                                    item!.loungeImageList![index] ?? "",

                                                    fit: BoxFit.cover,
                                                    cache: true,

                                                    loadStateChanged: (ExtendedImageState state) {
                                                      if (state.extendedImageLoadState == LoadState.failed) {
                                                        return Image.asset(
                                                          logoPath,
                                                          fit: BoxFit.cover,

                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              if(item!.likeList!.contains(authController.myInfo!.memberUid)){
                                                item!.likeList!.remove(authController.myInfo!.memberUid); // 로컬저장
                                                dataController.updateLoungeLike(item!.loungeKey! , authController!.myInfo!.memberUid! , false);// 데이터베이스 저장
                                              }else{
                                                item!.likeList!.add(authController.myInfo!.memberUid); //로컬저장
                                                dataController.updateLoungeLike(item!.loungeKey! , authController!.myInfo!.memberUid! , true);// 데이터베이스 저장
                                              }
                                              setState(() {

                                              });

                                            },
                                            child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 15),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [

                                                    if(item!.likeList!.contains(authController.myInfo!.memberUid))
                                                    SvgPicture.asset('assets/images/myicon/filled_heart.svg',colorFilter: ColorFilter.mode(appColorRed2 , BlendMode.srcIn),height: 15,),
                                                    if(!item!.likeList!.contains(authController.myInfo!.memberUid))
                                                      SvgPicture.asset('assets/images/myicon/heart.svg',colorFilter: ColorFilter.mode(appColorRed2 , BlendMode.srcIn),height: 15,),
                                                    SizedBox(width: 4,),
                                                    Text("공감",style: TextStyles.sub_title14_b,),
                                                    SizedBox(width: 4,),
                                                    Text("${item!.likeList!.length}",style: TextStyles.sub_title14_b,),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                            thickness: 1,
                                            width: 20,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 15),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset('assets/images/icon/chatbubble.svg',colorFilter: ColorFilter.mode(appColorPrimary , BlendMode.srcIn)),
                                                  SizedBox(width: 4,),
                                                  Text("댓글",style: TextStyles.sub_title14_b,),
                                                  SizedBox(width: 4,),
                                                  Text("${item!.commentList!.length + item!.comment2List!.length}",style: TextStyles.sub_title14_b,),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    RectangleButton(name: "프로필 교환 신청"),
                                  ],
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                          Divider(thickness: 15,color: Color(0xFFf9f9f9),),
                          //댓글
                          Container(
                            constraints: BoxConstraints(minHeight: Get.height/3),
                            child: Column(
                              children: [
                                SizedBox(height: 50,),
                                SvgPicture.asset('assets/images/icon/chatbubble.svg',height: 30,),
                                Text("등록된 댓글이 없습니다.\n제일 먼저 댓글을 남겨보세요!",textAlign: TextAlign.center,)
                              ],
                            ),
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
                                  labelText: "공개 댓글 작성",
                                  controller: commentController,
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

                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(Icons.send))
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}



