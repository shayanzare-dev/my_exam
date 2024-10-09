import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../insfrastucture/route/route_names.dart';

class LoginController extends GetxController {
  void goToCategoryPage() {
    Get.offAndToNamed(RouteNames.categoryPage);
  }

  int id = 0;
  RxBool isShow = true.obs;
  TextEditingController fullNameEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  Future<void> goToRegisterPage() async {
    final Map<String, String> result = await Get.toNamed(RouteNames.register);
    if ((result['userName']?.isNotEmpty ?? false) &&
        (result['password']?.isNotEmpty ?? false)) {
      fullNameEditingController.text = result['userName']!;
      passwordEditingController.text = result['password']!;
    }
  }

  Widget buttonChangeStatus() => IconButton(
      onPressed: () => isShow.value = !isShow.value,
      icon: isShow.value
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off));

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

  String? passwordValidator(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return 'please enter some password';
    }
    if (value.length < 8) {
      return 'please enter more than 8 char';
    }

    return null;
  }
}
