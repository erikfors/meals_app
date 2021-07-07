import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

import '../Widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = "category_meal";
  final List<Meal> _availableMeals;
  // final String categoryId;
  // final String categoryTitle;

  CategoryMealScreen(this._availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs["title"];
    final categoryID = routeArgs["id"];

    final categoryMeals = _availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            id: categoryMeals[index].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
