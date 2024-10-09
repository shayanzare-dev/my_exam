import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/item_deatels_controller.dart';

class ItemDeatelsItem extends GetView<ItemDeatelsController> {
  const ItemDeatelsItem(
      {super.key,required this.itemTitle});

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemTitle),
          SizedBox(
            height: 60,
            width: 60,
            child: IconButton(
                onPressed: () => controller.removeItemDeatels(itemTitle),
                icon: Icon(Icons.clear)),
          )
        ],
      ),
    );
  }
}
