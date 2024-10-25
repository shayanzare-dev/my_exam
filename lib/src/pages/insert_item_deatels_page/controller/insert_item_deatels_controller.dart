import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InsertItemDeatelsController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

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

  void submitItemDetails() => Get.back<Map<String, dynamic>>(
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
