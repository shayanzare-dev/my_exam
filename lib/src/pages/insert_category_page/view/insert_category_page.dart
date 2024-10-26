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
      body: SafeArea(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) => Column(
        children: [
          Form(
              key: controller.formKey,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => controller.nameValidator(value),
                      controller: controller.insertCategoryController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(),
                        hintText: 'add a category..',
                      ),
                    ),
                  ))),
          ElevatedButton(
              onPressed: () => controller.submitValidator(context),
              child: const Text('add'))
        ],
      );
}
