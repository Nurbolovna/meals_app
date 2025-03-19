import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void setFilter(Filter filter, bool isActive ){
    state = {
      ...state, filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref){ return FilterNotifier();}); 

