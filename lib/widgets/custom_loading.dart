import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CustomLoading {
  static Widget defaultLoading() {
    return Center(
      child: SizedBox(
        width: 25,
        height: 25,
        child: CircularProgressIndicator(
          color: Get.theme.colorScheme.primary,
        ),
      ),
    );
  }

  static Widget defaultLoadingBox() {
    return Container(
      color: Color.fromARGB(9, 0, 0, 0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.secondary,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: 45.h,
          height: 45.h,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              color: Get.theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
