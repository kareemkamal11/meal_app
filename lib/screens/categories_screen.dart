import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/data/meal.dart';
import '../widgets/categorey_grid_item.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableFilters,
  });


  final List<Meal> availableFilters;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20, // المسافة بين العناصر الرأسية
        crossAxisSpacing: 20, // المسافة بين العناصر الافقية
        crossAxisCount: 2, // عدد العناصر في السطر الواحد
        childAspectRatio: 3 / 2, // نسبة العرض للارتفاع
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            availableFilters: availableFilters,
          )
      ],
    );
  }
}
