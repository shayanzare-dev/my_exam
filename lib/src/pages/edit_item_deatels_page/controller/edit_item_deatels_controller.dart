import 'package:either_dart/either.dart';
import 'package:exam/src/pages/edit_item_deatels_page/models/edit_item_details_dto.dart';
import 'package:exam/src/pages/shared/shayan_show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/edit_item_details_view_model.dart';
import '../repositories/edit_details_repository.dart';

class EditItemDetailsController extends GetxController {
  final int? id;

  EditItemDetailsController(this.id);

  @override
  void onInit() {
    super.onInit();
    if (id != null) {
      getDetailById(id!);
    }
  }

  final EditDetailsRepository _repository = EditDetailsRepository();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int categoryId = 0;
  final GlobalKey<FormState> formKey = GlobalKey();
  RxBool isLoading = false.obs,
      isRetryMode = false.obs,
      isEditLoading = false.obs;

  String? nameValidator(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return 'please enter some text';
    }
    if (value.length < 2) {
      return 'please enter more than 2 characters';
    }
    return null;
  }

  String? priceValidator(String? value) {
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return 'please enter some number';
    }
    return null;
  }

  Future<void> getDetailById(int id) async {
    isLoading.value = true;
    isRetryMode.value = false;
    final Either<String, EditItemDetailsViewModel> resultOrException =
        await _repository.getDetailById(id: id);
    isLoading.value = false;

    resultOrException.fold(
      (exception) {
        isRetryMode.value = true;
        shayanShowSnackBar(content1: 'get detail', content2: exception);
      },
      (value) {
        // editItemDetailsViewModel = EditItemDetailsViewModel(
        //     id: value.id,
        //     categoryId: value.categoryId,
        //     detailsName: value.detailsName,
        //     price: value.price);
        titleController.text = value.detailsName;
        priceController.text = value.price.toString();
        categoryId = value.categoryId;
        },
    );
  }

  Future<void> _editDetailById({required int id}) async {
    final EditItemDetailsDto newItemDetail = EditItemDetailsDto(
        detailsName: titleController.text,
        categoryId: categoryId,
        price: int.parse(priceController.text));

    // final EditItemDetailsDto newItemDetail = EditItemDetailsDto(
    //     detailsName: editItemDetailsViewModel.detailsName,
    //     categoryId: editItemDetailsViewModel.categoryId,
    //     price: editItemDetailsViewModel.price);
    isEditLoading.value = true;
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.editDetailById(
            detailId: id, editItemDetailDto: newItemDetail);
    isEditLoading.value = false;

    resultOrException.fold(
      (exception) {
        isLoading.value = false;
        shayanShowSnackBar(content1: 'edit detail', content2: exception);
      },
      (Map<String, dynamic> right) {
        Get.back(result: right);
      },
    );
  }

  void submitValidator(BuildContext context, {required int detailId}) {
    if ((formKey.currentState?.validate() ?? false)) {
      _editDetailById(id: detailId);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
