import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/register_controller.dart';

class MyRegisterForm extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyRegisterForm({super.key});

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('USER NAME'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => controller.nameValidator(value),
                  controller: controller.fullNameEditingController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(),
                    hintText: 'for example : shayan_zare',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('PASSWORD'),
                _verticalGap(),
                Obx(
                  () => TextFormField(
                    obscureText: controller.isShow.value,
                    validator: (value) => controller.passwordValidator(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.passwordEditingController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      border: const OutlineInputBorder(),
                      suffixIcon: controller.buttonChangeStatus(),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () => submitValidator(context),
                      child: const Text('Back to Login')),
                ),
              ],
            ),
          ),
        ),
      );

  void submitValidator(BuildContext context) {
    if ((_formKey.currentState?.validate() ?? false)) {
      controller.backToLogin();
    } else {}
  }

  Widget _verticalGap() => const SizedBox(
        height: 12,
      );
}
