import 'package:exam/src/pages/edit_item_deatels_page/controller/edit_item_deatels_controller.dart';
import 'package:get/get.dart';

class EditItemDeatelsBinding extends Bindings {
  @override
  void dependencies() {
    final Map<String, String?> itemDetailValue = Get.parameters;
    Get.lazyPut(() => EditItemDeatelsController(itemDetailValue));
  }
}
