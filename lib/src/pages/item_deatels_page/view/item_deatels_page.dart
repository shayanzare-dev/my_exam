import 'package:exam/src/pages/item_deatels_page/controller/item_deatels_controller.dart';
import 'package:exam/src/pages/item_deatels_page/view/widgets/item_deatels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDeatelsPage extends GetView<ItemDeatelsController> {
  const ItemDeatelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: controller.goToInsertItemDeatelsPage,
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 12,
          ),
          FloatingActionButton(
            onPressed: controller.goToEditItemDeatelsPage,
            child: Icon(Icons.edit),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('item deatels page'),
      ),
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() => Column(
        children: [
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.itemDeatels.length,
                  itemBuilder: (_, index) => ItemDeatelsItem(
                      itemTitle:
                          controller.itemDeatels[index].itemDeatelName)))),
        ],
      );
}
