import 'package:exam/src/pages/item_deatels_page/controller/item_deatels_controller.dart';
import 'package:get/get.dart';

class ItemDeatelsBinding extends Bindings {
  @override
  void dependencies() {
    final int? id = int.tryParse(Get.parameters['id'] ?? '');
    Get.lazyPut(
      () => ItemDetailsController(id),
    );
  }
}