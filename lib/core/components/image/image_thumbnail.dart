import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc/core/services/image.service.dart';

class ImageThumbnail extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Widget? child;
  final bool isLocal;
  final bool? isCircle;
  final double? radius;
  final TapCallBack? onItemTap;

  const ImageThumbnail({
    required this.image,
    this.width,
    this.height,
    this.child,
    this.isLocal = false,
    this.isCircle,
    this.radius,
    this.onItemTap,
    Key? key}) : super(key: key);

  localImage() {
    return InkWell(
      onTap: onItemTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image)
            )
        ),
      ),
    );
  }

  networkImage() {
    return InkWell(
      onTap: onItemTap,
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: ImageService.checkImage(image),
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(radius ?? 5),
              image: DecorationImage(
                  fit: BoxFit.cover, image: imageProvider
              ),
            ),
            child: child ?? Container(width: 0),
          ),
          errorWidget: (context, url, error) => localImage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLocal ? localImage() : networkImage();
  }
}


typedef TapCallBack = void Function();