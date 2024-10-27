import 'package:exam/src/pages/shared/shayan_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/category_controller.dart';
import 'widgets/categoty_item.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToInsertCategoryPage(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Text('welcome ${controller.userName}'),
            const Spacer(),
            const Text('CategoryPage'),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: Obx(() => _body())),
    );
  }

  Widget _retry() => Center(
        child: FloatingActionButton(
          onPressed: controller.getCategories,
          child: const Icon(Icons.refresh_outlined),
        ),
      );

  Widget _body() {
    if (controller.isLoading.value) {
      return Center(
        child: shayanProgressIndicator(),
      );
    } else if (controller.isRetryMode.value) {
      return Center(child: _retry());
    } else if (controller.categoryList.isEmpty) {
      return const Center(child: Text('empty categories'));
    } else {
      return _categories();
    }
  }

  Widget _categories() => ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: controller.categoryList.length,
        itemBuilder: (_, index) => CategoryItem(
            onTap: () => controller.goToItemDetailsPage(
                id: controller.categoryList[index].id),
            categoryTitle: controller.categoryList[index].categoryName),
      );
}
