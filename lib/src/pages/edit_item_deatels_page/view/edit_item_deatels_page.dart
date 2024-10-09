import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/edit_item_deatels_controller.dart';

class EditItemDeatelsPage extends GetView<EditItemDeatelsController> {
  const EditItemDeatelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() => Column(
        children: [],
      );
}
