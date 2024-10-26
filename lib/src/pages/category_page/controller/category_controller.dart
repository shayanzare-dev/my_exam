import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../../insfrastucture/routes/route_names.dart';
import '../../shared/shayan_show_snack_bar.dart';
import '../models/category_view_model.dart';
import '../repositories/category_repository.dart';

class CategoryController extends GetxController {
  final String? userName;

  CategoryController(this.userName);

  final CategoryRepository _repository = CategoryRepository();
  int idCount = 0;
  RxBool isLoading = false.obs, isRetryMode = false.obs;
  RxList<CategoryViewModel> categoryList = <CategoryViewModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    final Either<String, List<CategoryViewModel>> getCategories =
        await _repository.getCategories();
    getCategories.fold((exception) {
      isLoading.value = false;
      isRetryMode.value = true;
      shayanShowSnackBar(content1: 'category page', content2: exception);
    }, (categories) {
      isLoading.value = false;
      isRetryMode.value = false;
      categoryList.value = categories;
    });
  }

  void goToItemDetailsPage() {
    Get.toNamed(
      RouteNames.itemDetailsPage,
    )?.catchError((e) {
      print(e);
    });
    /*if (result != null && result.isNotEmpty) {
       // repositories.add(Category(id: ++idCount, categoryName: result));
    } else {
      print('is empty');
    }*/
  }

  Future<void> goToInsertCategoryPage() async {
    final Map<String, dynamic> result = await Get.toNamed(
      RouteNames.insertCategoryPage,
    )?.catchError((e) {
      print('error isss = $e');
    });
    if (result.isNotEmpty) {
      final CategoryViewModel newCategory =
          CategoryViewModel.fromJson(json: result);
      categoryList.add(newCategory);
    } else {
      print('is empty or null');
    }
  }
}