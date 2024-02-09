import 'package:flutter/material.dart';
import 'package:meal_app/data/meal.dart';
import 'package:meal_app/models/categorey.dart';

import '../screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.availableFilters,
  });

  final Category category;

  final List<Meal> availableFilters;

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
