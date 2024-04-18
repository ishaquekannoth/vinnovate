import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double? width;
  final BoxFit? boxFit;

  final BorderRadiusGeometry? borderRadius;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.height,
    this.width,
    this.borderRadius,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
              child: Image.network(
                imageUrl,
                height: height,
                width: width,
                fit: boxFit ?? BoxFit.fill,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                              progress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, url, progress) => SizedBox(
                  height: height,
                  width: width,
                ),
              ),
            )),
      ],
    );
  }
}
