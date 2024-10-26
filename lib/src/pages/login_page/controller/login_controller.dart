import 'package:either_dart/either.dart';
import 'package:exam/src/pages/shared/shayan_show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../insfrastucture/routes/route_names.dart';
import '../models/user_view_model.dart';
import '../repositories/login_repository.dart';

class LoginController extends GetxController {
  RxBool isShow = true.obs;
  RxBool isLoading = false.obs;
  final LoginRepository _repository = LoginRepository();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _loginUser() async {
    isLoading.value = true;
    final Either<String, UserViewModel> searchUser =
        await _repository.searchUser(
            userName: userNameController.text,
            password: passwordController.text);
    searchUser.fold((exception) {
      isLoading.value = false;
      shayanShowSnackBar(content1: 'login page', content2: exception);
    }, (user) {
      isLoading.value = false;
      print('user = $user');
      goToCategoryPage();
    });
  }

  void goToCategoryPage() {
    Get.offAndToNamed(RouteNames.categoryPage, parameters: {});
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
