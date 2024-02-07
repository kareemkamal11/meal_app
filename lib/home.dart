import 'package:flutter/material.dart';
import 'package:meal_app/data/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Meal> favoriteMeals = [];

  void toggleFavorite(Meal meal) {
    final isFavorite = favoriteMeals.contains(meal);
    setState(() {
      isFavorite ? favoriteMeals.remove(meal) : favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    void filterMeals(String id) {
      Navigator.of(context).pop();
      if (id == 'filters') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Filters(),
          ),
        );
      }
    }

    Widget currentScreen = CategoriesScreen(toggleFavorite: toggleFavorite);
    String title = 'Categories';

    if (selectedIndex == 1) {
      currentScreen = MealScreen(
        meals: favoriteMeals,
        toggleFavorite: toggleFavorite,
      );
      title = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: currentScreen,
      drawer: MainDrawer(toggleFilters: filterMeals),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
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
