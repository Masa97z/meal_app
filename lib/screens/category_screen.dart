import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CatehoryScreen extends StatelessWidget {
  const CatehoryScreen({super.key});

  void _onSelectCategory(BuildContext context, Category catrgory) {
    final felteredMeals = dummyMeals
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
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24),
        children: [
          // availableCategories.map(
          //         (category)=> CatrgoryItem(category: category)
          // ).toList(),
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
    );
  }
}
