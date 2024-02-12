import 'package:flutter/material.dart';
import 'package:meal_app/data/meal.dart';

import '../data/dummy_data.dart';
import '../widgets/categorey_grid_item.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableFilters,
  });

  final List<Meal> availableFilters;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 1,
    );
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (ctx, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 03),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        child: child,
      ),
      child: GridView(
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
              availableFilters: widget.availableFilters,
            )
        ],
      ),
    );
  }
}
