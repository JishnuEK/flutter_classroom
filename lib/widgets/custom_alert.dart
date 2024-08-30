import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:get/get.dart';

// import 'package:permission_handler/permission_handler.dart';

class CustomAlert {
  static ErrorSnackbar(String message,
      {String title = "Error", int duration = 3}) {
    return Get.snackbar('', '',
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Container(),
        padding: const EdgeInsets.only(bottom: 18, top: 10, left: 5, right: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customHorizontalGap(15),
            const Icon(Icons.error_outline, color: Colors.white),
            customHorizontalGap(15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10));
  }

  static warningSnackbar(String message,
      {String title = "Error", int duration = 3}) {
    return Get.snackbar('', '',
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Container(),
        padding: const EdgeInsets.only(bottom: 18, top: 10, left: 5, right: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customHorizontalGap(15),
            const Icon(Icons.warning, color: Colors.white),
            customHorizontalGap(15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10));
  }

  static defaultSnackbar(String message,
      {String title = "", int duration = 3}) {
    return Get.snackbar('', '',
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.green.shade200,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Container(),
        padding: const EdgeInsets.only(bottom: 18, top: 10, left: 5, right: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customHorizontalGap(15),
            const Icon(Icons.done_outline_outlined, color: Colors.black),
            customHorizontalGap(15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10));
  }
}
