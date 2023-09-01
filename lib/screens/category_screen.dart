import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/widgets/main_drwar.dart';

class CatehoryScreen extends StatefulWidget {
  const CatehoryScreen({
    super.key,
    required this.onSelectScreen,
    required this.availableMeal,
  });

  final List<Meal> availableMeal;

  final void Function(String identifire) onSelectScreen;

  @override
  State<CatehoryScreen> createState() => _CatehoryScreenState();
}

class _CatehoryScreenState extends State<CatehoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onSelectCategory(BuildContext context, Category catrgory) {
    final felteredMeals = widget.availableMeal
        .where(
          (meal) => meal.categories.contains(catrgory.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: catrgory.title,
          meals: felteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick your category'),
      ),
      drawer: MainDrawer(onSelectScreen: widget.onSelectScreen),
      body: AnimatedBuilder(
          animation: _animationController,
          child: GridView(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24),
            children: [
              for (final category in availableCategories)
                CatrgoryItem(
                  category: category,
                  onSelect: () {
                    _onSelectCategory(
                      context,
                      category,
                    );
                  },
                )
            ],
          ),
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.only(top: 100- _animationController.value*100),
              child: child,
            );
          }),
    );
  }
}
