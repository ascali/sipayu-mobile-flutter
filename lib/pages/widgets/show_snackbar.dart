import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipayu/constants/enum.dart';

SnackbarController showSnackBar(
    {String? title, String? message, required SnackBarType snackBarType}) {
  switch (snackBarType) {
    case SnackBarType.success:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.error:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.info:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.warning:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.amber,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.warning_rounded,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );

    default:
      return Get.snackbar("$title", "$message");
  }
}
