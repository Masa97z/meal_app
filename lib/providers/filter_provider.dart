
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';
enum FilterItem {
  glutenFree,
  lactuseFree,
  vegetarian,
  vegin,
}

class FilterNotifier extends StateNotifier<Map<FilterItem, bool>>{
  FilterNotifier() :super({
    FilterItem.glutenFree:false,
    FilterItem.lactuseFree:false,
    FilterItem.vegetarian :false,
    FilterItem.vegin : false,
  });
  void setFilters (Map<FilterItem , bool> filters) {
    state = filters;
  }
  void setFilter (FilterItem filter , bool isActive){
    state = {
      ...state , filter:isActive,
    };
  }
}

final filtersProvader = StateNotifierProvider<FilterNotifier,Map<FilterItem , bool>>((ref) => FilterNotifier());
final filterMealsProvider = Provider((ref) {
  final activeFilter = ref.watch(filtersProvader) ;
  return ref.watch(mealsProvider).where((meal) {
    if (activeFilter[FilterItem.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[FilterItem.lactuseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[FilterItem.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[FilterItem.vegin]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});