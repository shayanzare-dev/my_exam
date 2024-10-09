import 'package:exam/src/insfrastucture/commons/data_base.dart';
import 'package:exam/src/insfrastucture/route/route_names.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class CategoryPageController extends GetxController {
  int idCount = 0;
  RxList<Category> categories = DataBase.categories.obs;

  Future<void> goToItemDeatelsPage() async {
    final String result = await Get.toNamed(
      RouteNames.itemDeatelsPage,
    );
    if (result.isNotEmpty) {
      categories.add(Category(id: ++idCount, categoryName: result));
    } else {
      print('is empty');
    }
  }

  Future<void> goToInsertCategoryPage() async {
    final String result = await Get.toNamed(
      RouteNames.insertCategoryPage,
    );
    if (result.isNotEmpty) {
      categories.add(Category(id: ++idCount, categoryName: result));
    } else {
      print('is empty');
    }
  }
}
