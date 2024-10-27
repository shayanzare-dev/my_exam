import 'package:get/get.dart';

import '../controllers/insert_item_deatels_controller.dart';

class InsertItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final int? categoryId = int.tryParse(Get.parameters['categoryId'] ?? '');
    Get.lazyPut(
      () => InsertItemDetailController(categoryId),
    );
  }
}
