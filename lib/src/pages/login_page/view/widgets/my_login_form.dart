import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/shayan_show_snack_bar.dart';
import '../../controller/login_controller.dart';

class MyLoginForm extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyLoginForm({super.key});

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
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('don\'t have any account !?'),
                    TextButton(
                        onPressed: () => controller.goToRegisterPage(),
                        child: const Text('Register'))
                  ],
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () => submitValidator(context),
                      child: const Text('login')),
                ),
              ],
            ),
          ),
        ),
      );

  void submitValidator(BuildContext context) {
    if ((_formKey.currentState?.validate() ?? false)) {
      shayanShowSnackBar(
          backgroundColor: Colors.green,
          content1: 'congratulation',
          content2: 'success status',
          icon: const Icon(Icons.done));
      controller.goToCategoryPage();
    } else {
      shayanShowSnackBar(
          content1: 'failed',
          content2: 'something is wrong',
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.error_outline_outlined,
          ));
    }
  }

  Widget _verticalGap() => const SizedBox(
        height: 12,
      );
}
