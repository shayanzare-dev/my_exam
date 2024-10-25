import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/category_page_controller.dart';
import 'widgets/categoty_item.dart';

class CategoryPage extends GetView<CategoryPageController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToInsertCategoryPage(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('CategoryPage'),
        centerTitle: true,
      ),
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: controller.categories.length,
                      itemBuilder: (_, index) => CategoryItem(
                          onTap: controller.goToItemDetailsPage,
                          categoryTitle:
                              controller.categories[index].categoryName),
                    )))
          ],
        ),
      );
}
