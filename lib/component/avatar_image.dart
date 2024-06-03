import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_image/extended_image.dart';

import '../global/global.dart';

///AvatarImage
///담당자 : ---

class AvatarImage extends StatefulWidget {
  final double? size;
  final String? imagePath;
  final void Function()? action;

  const AvatarImage({Key? key, this.size, this.imagePath , this.action})
      : super(key: key);

  @override
  State<AvatarImage> createState() => _AvatarImageState();
}

class _AvatarImageState extends State<AvatarImage> {
  @override
  void initState() {
    super.initState();
    logger.i("AvatarImage");
  }

  String sampleAsset = "assets/images/pluvlogo.png";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      widget.action == null
          ? () {
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
                  child: ExtendedImage.network(
                    widget.imagePath ?? "",
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
                      if (state.extendedImageLoadState ==
                          LoadState.failed) {
                        return Image.asset(
                          sampleAsset,
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
      }
          : () {

        widget.action!();

      },
      child: ExtendedImage.network(
        widget.imagePath ?? "",
        width: widget.size ?? 92,
        height: widget.size ?? 92,
        fit: BoxFit.cover,
        cache: true,
        shape: BoxShape.circle,
        loadStateChanged: (ExtendedImageState state) {
          if (state.extendedImageLoadState == LoadState.failed) {
            return Image.asset(
              sampleAsset,
              fit: BoxFit.cover,
              width: widget.size ?? 92,
              height: widget.size ?? 92,
            );
          }
        },
      ),
    );
  }
}
