

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifire extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifire() : super ([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((mealItm) => mealItm.id != meal.id).toList();
      return false ;
    }
    else{
      state = [...state , meal];
      return true;
    }

  }
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifire,List<Meal>>((ref) =>FavoriteMealsNotifire() );