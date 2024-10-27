import 'package:exam/src/pages/edit_item_deatels_page/controller/edit_item_deatels_controller.dart';
import 'package:get/get.dart';

class EditItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
   final int? id = int.tryParse(Get.parameters['id'] ?? '');
    Get.lazyPut(() => EditItemDetailsController(id));
  }
}
