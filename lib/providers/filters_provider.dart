import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/meal.dart';
import 'meals_provider.dart';

// create a provider like favorite_provider file here

enum ItemsFilters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<ItemsFilters, bool>> {
  FiltersNotifier()
      : super({
          ItemsFilters.glutenFree: false,
          ItemsFilters.lactoseFree: false,
          ItemsFilters.vegan: false,
          ItemsFilters.vegetarian: false,
        });

  void setFilter(ItemsFilters filter, bool value) {
    state = {...state, filter: value};
  }

  void setFilters(Map<ItemsFilters, bool> value) {
    state = value;
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<ItemsFilters, bool>>(
        (ref) => FiltersNotifier());

final filteredProvider = Provider<List<Meal>>((ref) {
  final filters = ref.watch(filterProvider);
  final meals = ref.watch(mealsProvider);
  return meals.where((meal) {
    if (filters[ItemsFilters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[ItemsFilters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[ItemsFilters.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filters[ItemsFilters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
