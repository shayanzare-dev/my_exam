import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.onTap, required this.categoryTitle});

  final void Function() onTap;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(categoryTitle)),
      ),
    );
  }
}
