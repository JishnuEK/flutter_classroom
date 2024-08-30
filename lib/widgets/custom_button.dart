import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/common/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton {
  static textButton(context,
      {required Function() onPressed,
      required String title,
      Widget? icon,
      Color color1 = LightPrimary,
      Color color2 = LightPrimary,
      double radius = CustomSize.cardradius}) {
    return SizedBox(
        height: CustomSize.containerHeight,
        child: SizedBox.expand(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: color1),
          child: TextButton(
              onPressed: () {
                onPressed();
              },
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  // backgroundColor: WidgetStateProperty.all(
                  //     Theme.of(context).colorScheme.primary),
                  foregroundColor: WidgetStateProperty.all(color2),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  ),
                  textStyle: WidgetStateProperty.all(
                    GoogleFonts.openSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title),
                  if (icon != null) SizedBox(width: 10),
                  if (icon != null) (icon),
                ],
              )),
        )));
  }
}
