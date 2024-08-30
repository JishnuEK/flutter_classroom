import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    required this.subtitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String content;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Colors.white)),
              height: 100.h,
              width: 100.h,
              child: ClipOval(
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              )),
        ),
        customVerticalGap(15),
        Text(title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        Text(content, style: TextStyle(fontSize: 14.sp)),
        Text(subtitle, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }
}
