import 'package:exam/src/insfrastucture/commons/data_base.dart';
import 'package:get/get.dart';

import '../../../insfrastucture/route/route_names.dart';
import '../models/item_deatel.dart';

class ItemDeatelsController extends GetxController {
  RxList<ItemDeatel> itemDeatels = DataBase.itemDeatels.obs;

  /* void goBackPage() {
    Get.back();
  }*/
  void removeItemDeatels(String title) {
    final int index = itemDeatels.indexWhere(
      (element) => element.itemDeatelName == title,
    );
    if (index != -1) {
      itemDeatels.removeAt(index);
    }
  }

  void goToInsertItemDeatelsPage() async {
    final String result = await Get.toNamed(
      RouteNames.insertItemDeatelsPage,
    );
    if (result.isNotEmpty) {
      // todo
      //itemDeatels.add(ItemDeatel(id:, itemDeatelName:);
    } else {
      print('is empty');
    }
  }

  void goToEditItemDeatelsPage() async {
    final String result = await Get.toNamed(
      RouteNames.editItemDeatelsPage,
    );
    if (result.isNotEmpty) {
      // todo
      //itemDeatels.add(ItemDeatel(id:, itemDeatelName:);
    } else {
      print('is empty');
    }
  }
}
