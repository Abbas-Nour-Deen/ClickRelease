import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProviderProfilePhotoWidget extends StatelessWidget {
  final String? imageurl;
  final String type;
  const ProviderProfilePhotoWidget(
      {super.key, required this.imageurl, required this.type});

  @override
  Widget build(BuildContext context) {
    return type == 'provScreen'
        ? ClipRRect(
            borderRadius: imageurl == null || imageurl == ''
                ? BorderRadius.circular(0)
                : BorderRadius.circular(100),
            child: imageurl == null || imageurl == ''
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/person.svg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      showImageViewer(
                        context,
                        NetworkImage(imageurl!),
                        doubleTapZoomable: true,
                        immersive: false,
                        useSafeArea: true,
                        swipeDismissible: true,
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: imageurl!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SvgPicture.asset(
                        "assets/images/person.svg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        "assets/images/person.svg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          )
        : imageurl == null || imageurl == ''
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/images/person.svg"),
              )
            : InkWell(
                child: CachedNetworkImage(
                  imageUrl: imageurl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/person.svg",
                      height: 100,
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                  errorWidget: (context, url, error) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/person.svg",
                      height: 100,
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
  }
}
