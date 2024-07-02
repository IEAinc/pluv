import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:pluv/model/vo/lounge_vo.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///LoungeTextDetailPage
///담당자 : ---

class LoungeTextDetailPage extends StatefulWidget {
  final LoungeVo item;
  const LoungeTextDetailPage({Key? key ,required this.item}) : super(key: key);

  @override
  State<LoungeTextDetailPage> createState() => _LoungeTextDetailPageState();
}

class _LoungeTextDetailPageState extends State<LoungeTextDetailPage> {

  @override
  void initState() {
    super.initState();
    logger.i("LoungeTextDetailPage");
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: widget.item.loungeTitle),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //텍스트영역
              Container(
                  child: Text(widget.item!.loungeDescription!,style: TextStyles.contents15_b,)),
              SizedBox(height: 10,),
              //만약이미지가 있다면
              if(widget.item!.loungeImageList!.length>0)
                Column(
                  children: [
                    PageViewDotIndicator(
                      currentItem: _currentIndex,
                      count: widget.item!.loungeImageList!.length,
                      unselectedColor: appColorGray1,
                      selectedColor: appColorPrimary,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.zero
                    ),
                    SizedBox(height: 5,),
                    Container(
                      constraints: BoxConstraints(maxHeight: Get.height/2),
                      child: PageView.builder(
                        itemCount: widget.item!.loungeImageList!.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex= index;
                          });

                        },
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
                                          widget.item!.loungeImageList![index] ?? "",
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
                              widget.item!.loungeImageList![index] ?? "",

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
                    ),
                  ],
                )

            ],
          ),
        ),
      ),
    );
  }
}
