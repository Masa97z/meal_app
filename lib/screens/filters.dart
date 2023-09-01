import 'package:flutter/material.dart';

enum FilterItem {
  glutenFree,
  lactuseFree,
  vegetarian,
  vegin,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
    required this.currentFilter,
  });

  final Map<FilterItem, bool> currentFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFilterSet = false;
  var _lactuseFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;
@override
  void initState() {
    super.initState();
     _glutenFilterSet = widget.currentFilter[FilterItem.glutenFree]!;
     _lactuseFilterSet = widget.currentFilter[FilterItem.lactuseFree]!;
     _vegetarianFilterSet = widget.currentFilter[FilterItem.vegetarian]!;
     _veganFilterSet = widget.currentFilter[FilterItem.vegin]!;
  }
  Widget filtredItem(bool fliter, String message) {
    return SwitchListTile(
      value: fliter,
      onChanged: (isChackes) {
        setState(() {
          fliter = isChackes;
        });
      },
      title: Text(
        message,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        'Only include $message meals.',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      // drawer: MainDrawer(onSelectScreen: (val) {
      //   Navigator.pop(context);
      //   if (val == 'meals') {
      //     Navigator.of(context).push(
      //         MaterialPageRoute(builder: (ctx) => TabsScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            FilterItem.glutenFree: _glutenFilterSet,
            FilterItem.lactuseFree: _lactuseFilterSet,
            FilterItem.vegetarian: _vegetarianFilterSet,
            FilterItem.vegin: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFilterSet,
              onChanged: (isChackes) {
                setState(() {
                  _glutenFilterSet = isChackes;
                });
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
              value: _lactuseFilterSet,
              onChanged: (isChackes) {
                setState(() {
                  _lactuseFilterSet = isChackes;
                });
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
              value: _vegetarianFilterSet,
              onChanged: (isChackes) {
                setState(() {
                  _vegetarianFilterSet = isChackes;
                });
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
              value: _veganFilterSet,
              onChanged: (isChackes) {
                setState(() {
                  _veganFilterSet = isChackes;
                });
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
      ),
    );
  }
}
