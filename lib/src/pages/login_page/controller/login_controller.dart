import 'dart:core';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../insfrastucture/routes/route_names.dart';
import '../../shared/shayan_show_snack_bar.dart';
import '../models/user_view_model.dart';
import '../repositories/login_repository.dart';

class LoginController extends GetxController {
  List<UserViewModel> userList = [];
  RxBool isShow = true.obs;
  RxBool isLoading = false.obs;
  final LoginRepository _repository = LoginRepository();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _loginUser() async {
    isLoading.value = true;
    final Either<String, List<UserViewModel>> resultOrException =
        await _repository.getUser(
            userName: userNameController.text,
            password: passwordController.text);
    resultOrException.fold((exception) {
      isLoading.value = false;
      shayanShowSnackBar(content1: 'login page', content2: exception);
    }, (users) {
      isLoading.value = false;
      userList = users;
    });
    final bool isUserNameFound =
        userList.any((user) => user.userName == userNameController.text);
    final bool isPasswordFound =
        userList.any((user) => user.password == passwordController.text);
    if (isUserNameFound && isPasswordFound) {
      goToCategoryPage();
    } else {
      shayanShowSnackBar(content1: 'login page', content2: 'not found');
    }
  }

  void goToCategoryPage() {
    Get.offAndToNamed(RouteNames.categoryPage, parameters: {
      'userName': userNameController.text,
    });
  }

  Future<void> goToRegisterPage() async {
    final result = await Get.toNamed(RouteNames.register);
    if (result != null && result.isNotEmpty) {
      final UserViewModel newUser = UserViewModel.fromJson(json: result);
      userNameController.text = newUser.userName;
      passwordController.text = newUser.password;
    } else {
      print('new user is empty');
    }
  }

  Widget buttonChangeStatus() => IconButton(
      onPressed: () => isShow.value = !isShow.value,
      icon: isShow.value
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off));

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

  void submitValidator(BuildContext context) {
    if ((formKey.currentState?.validate() ?? false)) {
      _loginUser();
    }
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
}
