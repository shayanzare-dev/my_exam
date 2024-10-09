import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isShow = true.obs;
  late final TextEditingController fullNameEditingController;

  late final TextEditingController passwordEditingController;

  @override
  void onInit() {
    fullNameEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    super.onInit();
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

  void backToLogin() => Get.back<Map<String, String>>(result: {
        'userName': fullNameEditingController.text,
        'password': passwordEditingController.text
      });
}
