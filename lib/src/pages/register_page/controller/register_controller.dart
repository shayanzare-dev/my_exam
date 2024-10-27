import 'package:either_dart/either.dart';
import 'package:exam/src/pages/shared/shayan_show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/register_user_dto.dart';
import '../repositories/register_repository.dart';

class RegisterController extends GetxController {
  RxBool isShow = true.obs;
  RxBool isLoading = false.obs;
  final RegisterRepository _repository = RegisterRepository();
  final TextEditingController fullNameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    fullNameEditingController.dispose();
    passwordEditingController.dispose();
  }

  Future<void> registerUser() async {
    isLoading.value = true;
    final RegisterUserDto userDto = RegisterUserDto(
        userName: fullNameEditingController.text,
        password: passwordEditingController.text);
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.registerUser(registerUserDto: userDto);
    resultOrException.fold(
      (exception) {
        isLoading.value = false;
        shayanShowSnackBar(content1: 'register', content2: exception);
      },
      (Map<String, dynamic> registerUserData) {
        isLoading.value = false;
        backToLogin(registerUserData);
      },
    );
  }

  void submitValidator(BuildContext context) {
    if ((formKey.currentState?.validate() ?? false)) {
      registerUser();
    }
  }

  void backToLogin(Map<String, dynamic> data) =>
      Get.back(result: data);

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
