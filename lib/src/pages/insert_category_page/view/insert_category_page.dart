import 'package:exam/src/pages/insert_category_page/controller/insert_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertCategoryPage extends GetView<InsertCategoryController> {
  const InsertCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Category Page'),
        centerTitle: true,
      ),
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() => Column(
        children: [
          TextField(
            controller: controller.insertCategoryController,
            decoration: InputDecoration(labelText: 'input_'),
          ),
          ElevatedButton(
              onPressed: controller.backToPage,
              child: const Text('back the page'))
        ],
      );
}
