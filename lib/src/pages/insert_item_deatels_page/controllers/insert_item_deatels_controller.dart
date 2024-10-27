import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../shared/shayan_show_snack_bar.dart';
import '../models/item_details_dto.dart';
import '../repositories/insert_item_details_repository.dart';

class InsertItemDetailController extends GetxController {
  final int? categoryId;

  InsertItemDetailController(this.categoryId);

  final TextEditingController detailNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final InsertItemDetailsRepository _repository = InsertItemDetailsRepository();

  RxBool isLoading = false.obs;
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

  Future<void> _insertItemDetail({required int categoryId}) async {
    isLoading.value = true;
    final ItemDetailsDto itemDetailsDtp = ItemDetailsDto(
        detailsName: detailNameController.text,
        categoryId: categoryId,
        price: int.parse(priceController.text));
    final Either<String, Map<String, dynamic>> resultOrException =
        await _repository.addItemDetail(itemDetailsDto: itemDetailsDtp);
    resultOrException.fold(
      (exception) {
        isLoading.value = false;
        shayanShowSnackBar(
            content1: 'insert item details', content2: exception);
      },
      (Map<String, dynamic> newItemDetails) {
        isLoading.value = false;
        Get.back(result: newItemDetails);
      },
    );
  }

  void submitItemDetails() {
    if (formKey.currentState?.validate() ?? false) {
      if (categoryId != null) {
        _insertItemDetail(categoryId: categoryId!);
      } else {
        print('category id is null');
      }
    }
  }

  @override
  void dispose() {
    detailNameController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
