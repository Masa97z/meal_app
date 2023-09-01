import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_app/providers/favorites_providwe.dart';
import 'package:meal_app/providers/filter_provider.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/providers/meals_provider.dart';

const KInitFilter = {
  FilterItem.glutenFree: false,
  FilterItem.lactuseFree: false,
  FilterItem.vegetarian: false,
  FilterItem.vegin: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }





  void setScreen(String identifire) async {
    Navigator.pop(context);
    if (identifire == 'filter') {
       await Navigator.of(context).push<Map<FilterItem, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final availableFilter = ref.watch(filterMealsProvider);


    Widget activeScreen = CatehoryScreen(
      onSelectScreen: setScreen,
      availableMeal: availableFilter,
    );
    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(
        title: "Favorite",
        meals: favoriteMeals,
      );
    }
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
