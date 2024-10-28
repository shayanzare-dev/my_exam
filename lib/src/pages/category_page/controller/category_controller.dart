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

  Future<void> goToItemDetailsPage({required int id}) async {
    final result =
        await Get.toNamed(RouteNames.itemDetailsPage, parameters: {'id': '$id'})
            ?.catchError((e) {
      print(e);
    });

    /// Todo: patch , loading , then edit local category on List
    /// 
    if (result != null) {
      print('value of item details $result');
    }
  }

  Future<void> editCategory()async{
    final Either<String,Map<String,dynamic>> _resultOrException = await _repository.editCategory(categoryId: , categoryDto: categoryDto)
  }
  Future<void> goToInsertCategoryPage() async {
    final Map<String, dynamic> result = await Get.toNamed(
      RouteNames.insertCategoryPage,
    )?.catchError((e) {
      print('error is = $e');
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
