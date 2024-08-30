import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CustomAppBar {
  static AppBar appbar(context,
      {String? title, Widget? button, double? toolbarHeight}) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      toolbarHeight: toolbarHeight,
      leading: ModalRoute.of(context)!.canPop
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: CustomSize.iconSize,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: () {
                Get.back();
              },
            )
          : null,
      title: title == null
          ? null
          : Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
      centerTitle: true,
      actions: button == null ? null : [button],
    );
  }
}
