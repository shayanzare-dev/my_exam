import 'package:exam/src/pages/category_page/controller/category_controller.dart';
import 'package:get/get.dart';

class CategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    final String? userName = Get.parameters['userName'];
    Get.lazyPut(
      () => CategoryController(userName),
    );
  }
}
