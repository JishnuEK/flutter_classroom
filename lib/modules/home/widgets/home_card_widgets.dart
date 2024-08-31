import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeCardBuild extends StatelessWidget {
  const HomeCardBuild(
      {super.key,
      required this.icon,
      required this.name,
      required this.color,
      this.showIcon = true,
      required this.onClick});

  final String name;
  final String icon;
  final Color color;
  final Function onClick;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (color),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: SizedBox(
          width: Get.size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showIcon
                  ? Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                              height: 85,
                              width: 85,
                              child: Image.asset(
                                icon,
                              ))),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: Get.textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
