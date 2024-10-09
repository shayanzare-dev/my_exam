import 'package:exam/src/pages/insert_category_page/controller/insert_category_controller.dart';
import 'package:get/get.dart';

class InsertCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InsertCategoryController(),
    );
  }
}
