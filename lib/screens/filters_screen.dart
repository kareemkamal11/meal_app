import 'package:flutter/material.dart';
// import 'package:meal_app/home.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

// ignore: must_be_immutable
class Filters extends StatefulWidget {
  const Filters({
    super.key,
  });

  @override
  State<Filters> createState() => _FiltersState();
}

enum ItemsFilters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

Map<ItemsFilters, bool> currentFilters = {};




class _FiltersState extends State<Filters> {
  // اريد حفظ بعض القيم الخاصة بالفلترة عند تدمير الصفحة

  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;


  @override
  void dispose() {
    currentFilters = {
      ItemsFilters.glutenFree: isGlutenFree,
      ItemsFilters.lactoseFree: isLactoseFree,
      ItemsFilters.vegan: isVegan,
      ItemsFilters.vegetarian: isVegetarian,
    };
    super.dispose();
  } //تعني

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            customSwitch(
              context,
              val: isGlutenFree,
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals',
              fun: (newVal) {
                setState(() {
                  isGlutenFree = newVal;
                });
              },
            ),
            customSwitch(
              context,
              val: isLactoseFree,
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals',
              fun: (newVal) {
                setState(() {
                  isLactoseFree = newVal;
                });
              },
            ),
            customSwitch(
              context,
              val: isVegan,
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              fun: (newVal) {
                setState(() {
                  isVegan = newVal;
                });
              },
            ),
            customSwitch(
              context,
              val: isVegetarian,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              fun: (newVal) {
                setState(() {
                  isVegetarian = newVal;
                });
              },
            ),
          ],
        ),
      ),
      // drawer: MainDrawer(
      //   toggleFilters: (id) {
      //     if (id == 'filters') {
      //       Navigator.of(context).pop();
      //     } else {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const HomeScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  SwitchListTile customSwitch(
    context, {
    required bool val,
    required String title,
    required String subtitle,
    required Function(bool newVal) fun,
  }) {
    return SwitchListTile(
      value: val,
      onChanged: fun,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
