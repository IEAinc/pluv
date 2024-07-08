import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluv/component/custom_input_filed.dart';
import 'package:pluv/controller/status_controller.dart';
import 'package:pluv/global/text_styles.dart';
import 'package:pluv/model/vo/lounge_vo.dart';

import '../../component/category_select_bottom_sheet.dart';
import '../../component/custom_progress_indicator.dart';
import '../../controller/auth_controller.dart';
import '../../controller/data_controller.dart';
import '../../global/global.dart';

///LoungeWritePage
///담당자 : ---

class LoungeWritePage extends StatefulWidget {
  final LoungeVo? item;
  const LoungeWritePage({Key? key, this.item}) : super(key: key);

  @override
  State<LoungeWritePage> createState() => _LoungeWritePageState();
}

class _LoungeWritePageState extends State<LoungeWritePage> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeWritePage");
    setState(() {
      if(widget?.item == null){
        mode = 1;
      }else{
        //수정모드
        loungeCategoryCode = widget!.item!.loungeCategoryCode!;
        loungeTitleController.text = widget!.item!.loungeTitle!;
        loungeDescriptionController.text =widget!.item!.loungeDescription!;
        imageList = widget!.item!.loungeImageList!;
        mode = 2;
      }
    });
  }

  int mode = 1; //1 = add모드 , 2 = edit모드
  String? loungeCategoryCode;
  TextEditingController loungeTitleController =  TextEditingController();
  TextEditingController loungeDescriptionController =  TextEditingController();



  List<dynamic> imageList = []; // 이미지리스트



  Future<void> _addImage() async {
    XFile? file = await pickImage();
    if(this.imageList.length<3){
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

  StatusController statusController = Get.find<StatusController>();
  DataController dataController = Get.find<DataController>();
  AuthController authController = Get.find<AuthController>();

  bool _loading = false;


  Container picture_box(int index) {
    return Container(
      height: (Get.width-20-32)/5,
      width: (Get.width-20-32)/5,
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
          :Stack(
        fit: StackFit.expand,
            children: [
              GestureDetector(
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
                          child:(this.imageList[index] is String)?ExtendedImage.network(
                            this.imageList[index] ?? "",
                            fit: BoxFit.cover,
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
                              switch (state.extendedImageLoadState) {
                                case LoadState.loading:
                                  return CustomProgressIndicator();
                                case LoadState.completed:
                                  return state.completedWidget;
                                case LoadState.failed:
                                  return Icon(Icons.error);
                              }
                            },
                          ): ExtendedImage.file(
                            this.imageList[index] ?? "",
                            fit: BoxFit.cover,
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
                              switch (state.extendedImageLoadState) {
                                case LoadState.loading:
                                  return CustomProgressIndicator();
                                case LoadState.completed:
                                  return state.completedWidget;
                                case LoadState.failed:
                                  return Icon(Icons.error);
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );

              },
              onLongPress: (){
                _editImage(index);
              },
              child: (this.imageList[index] is String)
                  ?ExtendedImage.network(
                this.imageList[index],
                cache: true,
                fit: BoxFit.cover,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return CustomProgressIndicator();
                    case LoadState.completed:
                      return state.completedWidget;
                    case LoadState.failed:
                      return Icon(Icons.error);
                  }
                },
              )
                  :Image.file(this.imageList[index],fit: BoxFit.cover,)),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: (){
                    imageList.removeAt(index);
                    setState(() {

                    });
                  },
                  child: Container(

                    width: 12,
                    height: 12,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: appColorGray1.withOpacity(0.9),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                    ),

                    child: SvgPicture.asset('assets/images/myicon/ax.svg',colorFilter: ColorFilter.mode(appColorWhite, BlendMode.srcIn)),
                  ),
                ),
              )
            ],
          ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: customAppBar(title: "라운지 글쓰기",actions: [Center(child: GestureDetector(

                onTap: () async{
                  if(loungeCategoryCode==null || loungeCategoryCode ==""){
                    getCautionSnackbar("라운지 카테고리를 선택해주세요");
                  }else{
                    if(loungeTitleController.text==null || loungeTitleController.text ==""){
                      getCautionSnackbar("라운지 제목을 입력해주세요");
                    }else{
                      if(loungeDescriptionController.text==null || loungeDescriptionController.text ==""){
                        getCautionSnackbar("라운지 내용을 입력해주세요");
                      }else{
                        if(mode==1){
                          LoungeVo loungeVo = LoungeVo();
                          loungeVo.writerUid=authController.myInfo!.memberUid;
                          loungeVo.writerGender=authController.myInfo!.memberGender;
                          loungeVo.loungeCategoryCode=loungeCategoryCode;
                          loungeVo.loungeTitle=loungeTitleController.text;
                          loungeVo.loungeDescription=loungeDescriptionController.text;
                          loungeVo.loungeImageList=imageList;

                          try{
                            setState(() {
                              _loading = true;
                            });
                            await dataController.addLounge(loungeVo);

                            Get.until((route) => Get.currentRoute == '/');
                          }catch(e){
                            logger.e(e);
                          }finally{
                            setState(() {
                              _loading = false;
                            });
                          }
                        }else{

                          try{
                            setState(() {
                              _loading = true;
                            });
                            widget.item!.loungeCategoryCode = loungeCategoryCode;
                            widget.item!.loungeTitle = loungeTitleController.text;
                            widget.item!.loungeDescription = loungeDescriptionController.text;
                            widget.item!.loungeImageList = imageList;

                            await dataController.updateLounge(widget.item!);

                            Get.until((route) => Get.currentRoute == '/');
                          }catch(e){
                            logger.e(e);
                          }finally{
                            setState(() {
                              _loading = false;
                            });
                          }
                        }


                      }

                    }
                  }

                },
                child: Text(mode==1?"등록":"수정"))),SizedBox(width: 16,)]),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(height: 1,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5,color: appColorGray3))),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: Get.height/2,
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
                                              Text("카테고리")
                                            ],
                                          )),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: statusController.appInfo.loungeCategoryCode!.length!,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      loungeCategoryCode = statusController.appInfo.loungeCategoryCode![index].code;
                                                      Get.back();
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                                    width: Get.width,
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        Center(child: Text(statusController.appInfo.loungeCategoryCode![index].title!)),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )



                                        ],
                                      )
                                  );
                                },
                              );
                              logger.e("SDff");
                            },
                            child: Text(loungeCategoryCode==null?'카테고리 선택':statusController.findTitleByCode(statusController.appInfo.loungeCategoryCode!, loungeCategoryCode!),style: TextStyles.sub_title15_b,)),

                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: loungeTitleController,
                          style: TextStyles.sub_title15_b,
                            decoration: InputDecoration(
                                hintText: "라운지 제목을 입력해주세요.",
                              enabledBorder: UnderlineInputBorder(

                                  borderSide: BorderSide(
                                      color: appColorGray2,)
                              ),
                              focusedBorder: UnderlineInputBorder(

                                  borderSide: BorderSide(color: appColorGray2)
                              ),
                            )

                        ),
                        TextFormField(
                          maxLines: 10,
                            controller: loungeDescriptionController,
                          style: TextStyles.contents15_b,
                            decoration: InputDecoration(
                                hintText: "내용을 입력해주세요.",
                              enabledBorder: UnderlineInputBorder(

                                  borderSide: BorderSide(
                                    color: Colors.transparent,)
                              ),
                              focusedBorder: UnderlineInputBorder(

                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                            )

                        ),

                      ],

                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        picture_box(0),
                        SizedBox(width: 10,),
                        picture_box(1),
                        SizedBox(width: 10,),
                        picture_box(2),


                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/myicon/picture.svg',width: 12,height: 12,),
                        SizedBox(width: 5,),
                        Text("${imageList.length}/3")
                      ],
                    ),
                  ),



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
}

