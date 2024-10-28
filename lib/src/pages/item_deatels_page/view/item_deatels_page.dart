import 'package:exam/src/pages/item_deatels_page/controller/item_deatels_controller.dart';
import 'package:exam/src/pages/item_deatels_page/view/widgets/item_deatels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/shayan_progress_indicator.dart';

class ItemDeatelsPage extends GetView<ItemDetailsController> {
  const ItemDeatelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToInsertItemDetailsPage,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('item details page'),
      ),
      body: SafeArea(child: Obx(() => _body())),
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      return Center(
        child: shayanProgressIndicator(),
      );
    } else if (controller.isRetryMode.value) {
      return Center(child: _retry());
    } else if (controller.itemDetailsList.isEmpty) {
      return const Center(child: Text('empty details'));
    } else {
      return _details();
    }
  }

  Widget _retry() => Center(
        child: FloatingActionButton(
          onPressed: () => controller.getDetails(categoryId: controller.id!),
          child: const Icon(Icons.refresh_outlined),
        ),
      );

  Widget _details() => ListView.builder(
      itemCount: controller.itemDetailsList.length,
      itemBuilder: (_, index) => ItemDeatelsItem(
          price: controller.itemDetailsList[index].price,
          itemTitle: controller.itemDetailsList[index].detailsName,
          removeItemDeatelsTap: () => controller
              .deleteItemDetails(controller.itemDetailsList[index].id),
          goToEditItemDeatelsTap: () => controller.goToEditItemDetailPage(
              idd: controller.itemDetailsList[index].id)));
}
