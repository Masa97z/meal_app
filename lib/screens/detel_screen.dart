import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';


class DetelScreen extends StatelessWidget {
  const DetelScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(meal.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              ),
              const SizedBox(height: 14,),
              Text('Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                  fontSize: 26
              ),),
              const SizedBox(height: 8,),
              for(final ingredients in meal.ingredients)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                  child: Text(ingredients,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 16
                    ),),
                ),
              const SizedBox(height: 24,),
              Text('Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                    fontSize: 26
                ),),
              const SizedBox(height: 8,),
              for(final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                  child: Text(step,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16
                    ),),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
