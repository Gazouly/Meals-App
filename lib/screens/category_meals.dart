import 'package:flutter/material.dart';

import 'package:meals_app/widgets/meals/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  const CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routingArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(routingArgs['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${routingArgs['title']} Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
