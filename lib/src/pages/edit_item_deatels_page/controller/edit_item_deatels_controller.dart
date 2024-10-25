import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemDeatelsController extends GetxController {
  final Map<String, String?> itemDetailValue;

  EditItemDeatelsController(this.itemDetailValue);

  late final TextEditingController titleController;
  late final TextEditingController priceController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController(text: itemDetailValue['title']);
    priceController = TextEditingController(text: itemDetailValue['price']);
  }

  String? nameValidator(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return 'please enter some text';
    }
    if (value.length < 2) {
      return 'please enter more than 2 characters';
    }
    if (value.contains(' ')) {
      return 'must don\'t have any spaces';
    }

    return null;
  }

  String? priceValidator(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return 'please enter some number';
    }
    if (value.contains(' ')) {
      return 'must don\'t have any spaces';
    }
    return null;
  }

  void editItemDetails() => Get.back<Map<String, dynamic>>(
        result: {
          'title': titleController.text,
          'price': int.tryParse(priceController.text) ?? 0,
        },
      );

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
