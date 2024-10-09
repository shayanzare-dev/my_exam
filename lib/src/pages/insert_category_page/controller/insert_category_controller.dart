import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InsertCategoryController extends GetxController {
  final TextEditingController insertCategoryController =
      TextEditingController();

  void backToPage() {
    Get.back(result: insertCategoryController.text);
  }
}
