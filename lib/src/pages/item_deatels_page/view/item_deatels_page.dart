import 'package:exam/src/pages/item_deatels_page/controller/item_deatels_controller.dart';
import 'package:exam/src/pages/item_deatels_page/view/widgets/item_deatels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDeatelsPage extends GetView<ItemDeatelsController> {
  const ItemDeatelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToInsertItemDeatelsPage,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('item deatels page'),
      ),
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() => Obx(() => ListView.builder(
      itemCount: controller.itemDetails.length,
      itemBuilder: (_, index) => ItemDeatelsItem(
          price: controller.itemDetails[index].price,
          itemTitle: controller.itemDetails[index].itemTitle,
          removeItemDeatelsTap: () => controller
              .removeItemDeatels(controller.itemDetails[index].itemTitle),
          goToEditItemDeatelsTap: () => controller.goToEditItemDeatelsPage(
              itemDetail: controller.itemDetails[index]))));
}
