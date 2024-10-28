import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/edit_item_deatels_controller.dart';

class EditItemDeatelsPage extends GetView<EditItemDetailsController> {
  const EditItemDeatelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit item'),
      ),
      body: SafeArea(child: Obx(() => _body(context))),
    );
  }

  Widget _body(BuildContext context) {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.isRetryMode.value) {
      return _retry();
    }
    return _editView(context);
  }

  Widget _retry() => Center(
        child: ElevatedButton(
          onPressed: () =>
              controller.getDetailById(controller.id!),
          child: const Text('retry'),
        ),
      );

  Widget _editView(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => controller.nameValidator(value),
                      controller: controller.titleController,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => controller.priceValidator(value),
                      controller: controller.priceController,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(),),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () => controller.submitValidator(
                      detailId: controller.id!,
                      context),
                  child: const Text('edit')),
            ),
          ],
        ),
      );
}
