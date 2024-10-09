import 'package:get/get.dart';

import '../controller/insert_item_deatels_controller.dart';

class InsertItemDeatelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InsertItemDeatelsController(),
    );
  }
}
