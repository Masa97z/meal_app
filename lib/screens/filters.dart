import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget{
  const FilterScreen({
    super.key,
  });
  

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvader);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),

      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[FilterItem.glutenFree]!,
            onChanged: (isChackes) {
              ref.read(filtersProvader.notifier).setFilter(FilterItem.glutenFree, isChackes);
            },
            title: Text(
              'Gluten Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          SwitchListTile(
            value: activeFilters[FilterItem.lactuseFree]!,
            onChanged: (isChackes) {
              ref.read(filtersProvader.notifier).setFilter(FilterItem.lactuseFree, isChackes);

            },
            title: Text(
              'Lactose Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          SwitchListTile(
            value: activeFilters[FilterItem.vegetarian]!,
            onChanged: (isChackes) {
              ref.read(filtersProvader.notifier).setFilter(FilterItem.vegetarian, isChackes);

            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          SwitchListTile(
            value: activeFilters[FilterItem.vegin]!,
            onChanged: (isChackes) {
              ref.read(filtersProvader.notifier).setFilter(FilterItem.vegin, isChackes);

            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ],
      ),
    );
  }
}
