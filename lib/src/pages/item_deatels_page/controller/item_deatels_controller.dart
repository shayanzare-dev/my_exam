import 'package:get/get.dart';

import '../../../insfrastucture/commons/data_base.dart';
import '../../../insfrastucture/routes/route_names.dart';
import '../models/item_deatel.dart';

class ItemDeatelsController extends GetxController {
  RxList<ItemDeatel> itemDetails = DataBase.itemDeatel.obs;

  void removeItemDeatels(String title) {
    final int index = itemDetails.indexWhere(
      (element) => element.itemTitle == title,
    );
    if (index != -1) {
      itemDetails.removeAt(index);
    }
  }

  Future<void> goToInsertItemDeatelsPage() async {
    final Map<String, dynamic>? result = await Get.toNamed(
      RouteNames.insertItemDetailsPage,
    )?.catchError((e) {
      print(e);
    });
    if (result != null && result.isNotEmpty) {
      itemDetails.add(ItemDeatel(
          id: 1, itemTitle: result['title'], price: result['price']));
    } else {
      print('result is empty');
    }
  }

  Future<void> goToEditItemDeatelsPage({required ItemDeatel itemDetail}) async {
    final Map<String, dynamic>? result = await Get.toNamed(
      RouteNames.editItemDetailsPage,
      parameters: {
        'title': itemDetail.itemTitle,
        'price': itemDetail.price.toString(),
      },
    )?.catchError((e) {
      print(e);
    });
    if (result != null && result.isNotEmpty) {
      final ItemDeatel newItem = ItemDeatel(
          id: itemDetail.id,
          itemTitle: result['title'],
          price: result['price']);
      itemDetails.add(newItem);
    } else {
      print('result is empty');
    }
  }

  @override
  void dispose() {
    DataBase.itemDeatel = itemDetails;
    super.dispose();
  }
}
