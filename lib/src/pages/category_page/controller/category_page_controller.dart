import 'package:exam/src/insfrastucture/commons/data_base.dart';
import 'package:exam/src/insfrastucture/routes/route_names.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class CategoryPageController extends GetxController {
  int idCount = 0;
  RxList<Category> categories = DataBase.categories.obs;

  void goToItemDetailsPage() {
    Get.toNamed(
      RouteNames.itemDetailsPage,
    )?.catchError((e) {
      print(e);
    });
    /*if (result != null && result.isNotEmpty) {
       // categories.add(Category(id: ++idCount, categoryName: result));
    } else {
      print('is empty');
    }*/
  }

  Future<void> goToInsertCategoryPage() async {
    final String? result = await Get.toNamed(
      RouteNames.insertCategoryPage,
    )?.catchError((e) {
      print('error isss = $e');
    });
    if (result != null && result.isNotEmpty) {
      categories.add(Category(id: ++idCount, categoryName: result));
    } else {
      print('is empty or null');
    }
  }
}
