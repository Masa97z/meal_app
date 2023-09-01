import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals_screen.dart';

const KInitFilter = {
  FilterItem.glutenFree: false,
  FilterItem.lactuseFree: false,
  FilterItem.vegetarian: false,
  FilterItem.vegin: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _faverote = [];
  int _selectedIndex = 0;
  Map<FilterItem, bool> _selectedFliter = KInitFilter;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }

  void _toggleMealFaveiroteState(Meal meal) {
    final isExesit = _faverote.contains(meal);
    setState(() {
      if (isExesit) {
        _faverote.remove(meal);
        showMessage('removed Meal');
      } else {
        _faverote.add(meal);
        showMessage('Add Meal');
      }
    });
  }

  void setScreen(String identifire) async {
    Navigator.pop(context);
    if (identifire == 'filter') {
      final result = await Navigator.of(context).push<Map<FilterItem, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            currentFilter: _selectedFliter,
          ),
        ),
      );
      setState(() {
        _selectedFliter = result ?? KInitFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableFilter = dummyMeals.where((meal) {
      if (_selectedFliter[FilterItem.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFliter[FilterItem.lactuseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFliter[FilterItem.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFliter[FilterItem.vegin]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CatehoryScreen(
      onToggleFaveriote: _toggleMealFaveiroteState,
      onSelectScreen: setScreen,
      availableMeal: availableFilter,
    );
    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(
        title: "Faverite",
        meals: _faverote,
        onToggleFaveriote: _toggleMealFaveiroteState,
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
            label: 'Faverote',
          ),
        ],
      ),
    );
  }
}
