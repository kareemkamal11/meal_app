import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';
// import 'package:meal_app/home.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

// ignore: must_be_immutable
class Filters extends ConsumerWidget {
  const Filters({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
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
              val: activeFilters[ItemsFilters.glutenFree]!,
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals',
              fun: (newVal) {
                ref.read(filterProvider.notifier).setFilters({
                  ItemsFilters.glutenFree: newVal,
                });
              },
            ),
            customSwitch(
              context,
              val: activeFilters[ItemsFilters.lactoseFree]!,
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals',
              fun: (newVal) {
                ref.read(filterProvider.notifier).setFilters({
                  ItemsFilters.lactoseFree: newVal,
                });
              },
            ),
            customSwitch(
              context,
              val: activeFilters[ItemsFilters.vegan]!,
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              fun: (newVal) {
                ref.read(filterProvider.notifier).setFilters({
                  ItemsFilters.vegan: newVal,
                });
              },
            ),
            customSwitch(
              context,
              val: activeFilters[ItemsFilters.vegetarian]!,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              fun: (newVal) {
                ref.read(filterProvider.notifier).setFilters({
                  ItemsFilters.vegetarian: newVal,
                });
              },
            ),
          ],
        ),
      ),
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
