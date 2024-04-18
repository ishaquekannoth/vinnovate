import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTagText extends StatelessWidget {
  const CustomTagText({
    super.key,
    required this.text,
    this.textAlign,
    this.onTap,
    this.margin,
    this.width,
  });
  final String text;
  final TextAlign? textAlign;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.only(bottom: 10.h),
        width: width ?? 270.w,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            maxLines: 1,
            textAlign: textAlign,
            style: TextStyle(fontSize: 12.h, overflow: TextOverflow.ellipsis),
          ),
        ));
  }
}
