import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../insfrastucture/utils/utils.dart';
import '../../../shared/shayan_progress_indicator.dart';
import '../../controller/login_controller.dart';

class MyLoginForm extends GetView<LoginController> {
  const MyLoginForm({super.key});

  @override
  Widget build(BuildContext context) => Form(
        key: controller.formKey,
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
                  controller: controller.userNameController,
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
                Utils.verticalGap,
                Obx(
                  () => TextFormField(
                    obscureText: controller.isShow.value,
                    validator: (value) => controller.passwordValidator(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      border: const OutlineInputBorder(),
                      suffixIcon: controller.buttonChangeStatus(),
                    ),
                  ),
                ),
                Utils.verticalGap,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('don\'t have any account !?'),
                    TextButton(
                        onPressed: controller.goToRegisterPage,
                        child: const Text('Register'))
                  ],
                ),
                Obx(
                  () => Center(
                    child: controller.isLoading.value
                        ? ElevatedButton(
                            onPressed: null,
                            child: Transform.scale(
                                scale: 0.5, child: shayanProgressIndicator()))
                        : ElevatedButton(
                            onPressed: () =>
                                controller.submitValidator(context),
                            child: const Text('login')),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
