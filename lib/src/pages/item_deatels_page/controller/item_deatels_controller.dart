import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../../insfrastucture/routes/route_names.dart';
import '../../shared/shayan_show_snack_bar.dart';
import '../models/details_view_model.dart';
import '../repositories/details_repository.dart';

class ItemDetailsController extends GetxController {
  final int? id;

  ItemDetailsController(this.id);

  int? categoryId;
  RxBool isLoading = false.obs, isRetryMode = false.obs;
  final DetailsRepository _repository = DetailsRepository();

  @override
  void onInit() {
    super.onInit();
    if (id != null) {
      categoryId = id!;
      getDetails(categoryId: categoryId!);
    }
  }

  RxList<DetailsViewModel> itemDetailsList = <DetailsViewModel>[].obs;
  int totalPrice = 0;

  Future<void> getDetails({required int categoryId}) async {
    isLoading.value = true;
    final Either<String, List<DetailsViewModel>> getDetails =
        await _repository.getDetails(categoryId: categoryId);
    getDetails.fold((exception) {
      isLoading.value = false;
      isRetryMode.value = true;
      shayanShowSnackBar(content1: 'details page', content2: exception);
    }, (details) {
      isLoading.value = false;
      isRetryMode.value = false;
      itemDetailsList.value = details;
    });

    totalPrice = itemDetailsList.fold(
        totalPrice, (previousValue, element) => previousValue += element.price);
  }

  void backToCategoryPage() {
    Map<String, dynamic> result = {
      'totalPrice': totalPrice,
      'categoryId': categoryId
    };
    Get.back(result: result);
  }

  Future<void> deleteItemDetails(int detailId) async {
    Either<String, bool> deleteDetail =
        await _repository.deleteDetail(detailId: detailId);
    if (deleteDetail.isRight) {
      final int index = itemDetailsList.indexWhere(
        (itemDetail) => itemDetail.id == detailId,
      );
      if (index != -1) {
        itemDetailsList.removeAt(index);
      }
    }
    if (deleteDetail.isLeft) {
      shayanShowSnackBar(content1: 'delete item', content2: deleteDetail.left);
    }
  }

  Future<void> goToInsertItemDetailsPage() async {
    final Map<String, dynamic>? result = await Get.toNamed(
        RouteNames.insertItemDetailsPage,
        parameters: {'categoryId': '$categoryId'})?.catchError((e) {
      print('error = $e');
    });
    if (result != null && result.isNotEmpty) {
      final DetailsViewModel newDetail =
          DetailsViewModel.fromJson(json: result);
      itemDetailsList.add(newDetail);
    } else {
      print('result is empty');
    }
  }

  Future<void> goToEditItemDetailPage({required int idd}) async {
    final Map<String, dynamic>? result = await Get.toNamed(
        RouteNames.editItemDetailsPage,
        parameters: {'id': '$idd'})?.catchError((e) {
      print(e);
    });
    if (result != null && result.isNotEmpty) {
      final DetailsViewModel detailsViewModel =
          DetailsViewModel.fromJson(json: result);
      final int index = itemDetailsList.indexWhere(
        (element) => element.id == detailsViewModel.id,
      );
      final bool isDetailItemFound = index != -1;
      if (isDetailItemFound) {
        itemDetailsList[index] = detailsViewModel;
      }
    } else {
      print('edit item is empty');
    }
  }
}
