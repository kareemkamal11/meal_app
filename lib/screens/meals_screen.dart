import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail.dart';

import '../data/meal.dart';
import '../widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
    required this.toggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(title: Text(title!)),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: meals
              .map((meal) => MealItem(
                    meal: meal,
                    selectMeal: (meal) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetial(
                            meal: meal,
                            toggleFavorite: toggleFavorite,
                          ),
                        ),
                      );
                    },
                  ))
              .toList()),
    );
  }
}
