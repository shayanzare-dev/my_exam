import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../spalsh_screen/controller/splash_controller.dart';
import 'widgets/my_login_form.dart';

class LoginScreen extends GetView<SplashController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        centerTitle: true,
      ),
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() => const MyLoginForm();
}
