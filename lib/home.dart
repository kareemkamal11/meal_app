import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import 'providers/favorite_provider.dart';
import 'providers/filters_provider.dart';
import 'providers/nav_bar_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(navBarProvider);
    final availableFilters = ref.watch(filteredProvider);

    final favoriteMeals = ref.watch(favoriteMealsProvider);

    Widget currentScreen = CategoriesScreen(
      availableFilters: availableFilters,
    );
    String title = 'Categories';

    if (selectedIndex == 1) {
      currentScreen = MealScreen(
        meals: favoriteMeals,
      );
      title = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: currentScreen,
      drawer: MainDrawer(toggleFilters: (String id) {
        Navigator.of(context).pop();
        if (id == 'filters') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Filters(),
            ),
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: ref.read(navBarProvider.notifier).updateIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
