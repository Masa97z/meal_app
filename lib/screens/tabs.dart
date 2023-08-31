import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/faverote_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0 ;
  void _selectedPage(int index){
   setState(() {
     _selectedIndex = index ;
   });
  }
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CatehoryScreen();
    if(_selectedIndex == 1)
    {
      activeScreen = MealsScreen(title: "Faverate", meals: []);
    }
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Faverote'),
          ],
      ),
    );
  }
}
