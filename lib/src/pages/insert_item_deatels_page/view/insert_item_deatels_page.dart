import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/insert_item_deatels_controller.dart';

class InsertItemDeatelsPage extends GetView<InsertItemDeatelsController> {
  const InsertItemDeatelsPage({super.key});

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
