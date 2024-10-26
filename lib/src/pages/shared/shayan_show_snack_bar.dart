import 'package:flutter/material.dart';
import 'package:get/get.dart';

void shayanShowSnackBar(
    {required String content1,
    required String content2,
    Icon? icon,
    Color? backgroundColor}) {
  Get.snackbar(
    duration: const Duration(milliseconds: 1000),
    backgroundColor: backgroundColor,
    content1,
    content2,
    icon: icon,
    snackPosition: SnackPosition.BOTTOM,
  );
}
