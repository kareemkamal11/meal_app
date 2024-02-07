import 'package:flutter/material.dart';
import 'package:meal_app/data/meal.dart';
import 'package:meal_app/models/categorey.dart';
import 'package:meal_app/screens/filters_screen.dart';

import '../data/dummy_data.dart';
import '../screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({
    super.key,
    required this.category,
    required this.toggleFavorite,
  });

  final Category category;

  final void Function(Meal meal) toggleFavorite;

  final List<Meal> availableFilters = dummyMeals.where((element) {
    if (currentFilters[ItemsFilters.glutenFree] == true &&
        !element.isGlutenFree) {
      return false;
    }
    if (currentFilters[ItemsFilters.lactoseFree] == true &&
        !element.isLactoseFree) {
      return false;
    }
    if (currentFilters[ItemsFilters.vegan] == true && !element.isVegan) {
      return false;
    }
    if (currentFilters[ItemsFilters.vegetarian] == true &&
        !element.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final list = availableFilters
            .where((meal) => meal.categories.contains(category.id))
            .toList(); // تحديد الوجبات التي تحتوي على الفئة المحددة فقط
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => MealScreen(
                    title: category.title,
                    meals: list,
                    toggleFavorite: toggleFavorite,
                  )),
        );
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.54),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
      ),
    );
  }
}
