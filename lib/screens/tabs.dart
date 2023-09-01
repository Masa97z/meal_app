import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/faverote_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drwar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _faverote = [];
  int _selectedIndex = 0;
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
  void setScreen(String identifire){
    if (identifire == 'filter'){

    }else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CatehoryScreen(
      onToggleFaveriote: _toggleMealFaveiroteState,
      onSelectScreen: setScreen,
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
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Faverote'),
        ],
      ),
    );
  }
}
