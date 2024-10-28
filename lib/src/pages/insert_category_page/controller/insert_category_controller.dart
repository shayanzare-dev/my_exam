import 'package:either_dart/either.dart';
import 'package:exam/src/pages/insert_category_page/models/insert_category_dto.dart';
import 'package:exam/src/pages/shared/shayan_show_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repositories/insert_category_repository.dart';

class InsertCategoryController extends GetxController {
  final TextEditingController insertCategoryController =
      TextEditingController();
  RxBool isLoading = false.obs;
  final InsertCategoryRepository _repository = InsertCategoryRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addCategory() async {
    isLoading.value = true;
    final InsertCategoryDto categoryDto = InsertCategoryDto(
      categoryName: insertCategoryController.text,
    );
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.addCategory(insertCategoryDto: categoryDto);
    resultOrException.fold(
      (exception) {
        isLoading.value = false;
        shayanShowSnackBar(
            content1: 'insert new category', content2: exception);
      },
      (Map<String, dynamic> newCategory) {
        isLoading.value = false;
        backToCategoryPage(newCategory);
      },
    );
  }

  void backToCategoryPage(Map<String, dynamic> data) {
    Get.back<Map<String, dynamic>>(result: data);
  }

  void submitValidator(BuildContext context) {
    if ((formKey.currentState?.validate() ?? false)) {
      addCategory();
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

  @override
  void dispose() {
    insertCategoryController.dispose();
    super.dispose();
  }
}
