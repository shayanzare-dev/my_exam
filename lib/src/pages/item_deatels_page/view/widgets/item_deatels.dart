import 'package:flutter/material.dart';

class ItemDeatelsItem extends StatelessWidget {
  const ItemDeatelsItem(
      {super.key,
      required this.itemTitle,
      required this.removeItemDeatelsTap,
      required this.goToEditItemDeatelsTap,
      required this.price});

  final String itemTitle;
  final int price;
  final void Function() removeItemDeatelsTap;
  final void Function() goToEditItemDeatelsTap;

  @override
  Widget build(BuildContext context) => Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text(itemTitle),
          SizedBox(width: 6,),
          Text('price : $price'),
          const Spacer(),
          IconButton(
              onPressed: removeItemDeatelsTap, icon: const Icon(Icons.clear)),
          IconButton(
            onPressed: goToEditItemDeatelsTap,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
}
