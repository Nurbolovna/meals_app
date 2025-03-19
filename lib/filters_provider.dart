import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/meals_provider.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>>{
  FilterNotifier(): super({
    Filter.glutenFree: false, 
    Filter.lactoseFree: false, 
    Filter.vegan: false, 
    Filter.vegetarian: false,  
  }); 

void setFilters(Map<Filter, bool> chosenFilters){
  state = chosenFilters; 
}
  void setFilter(Filter filter, bool isActive ){
    state = {
      ...state, filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref){ return FilterNotifier();}); 

final filteredMealsProvider = Provider((ref){ 
      final meals = ref.watch(mealsProvider);
      final activeFilters = ref.watch(filtersProvider);
      return meals.where((Meal) {
      if (activeFilters[Filter.glutenFree]! && !Meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !Meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !Meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !Meal.isVegan) {
        return false;
      }
      return true;
    }).toList();}
    
    );

