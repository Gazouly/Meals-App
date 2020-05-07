import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../widgets/categories/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                id: category.id,
                title: category.title,
                color: category.color,
                image: category.image,
              ))
          .toList(),
    );
  }
}
