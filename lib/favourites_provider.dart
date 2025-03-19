import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteNotifier extends StateNotifier <List<Meal>>{
FavouriteNotifier(): super ([]); 
bool toggleFavouriteStatus(Meal meal){
  final mealIsFavourite = state.contains(meal);
  if(mealIsFavourite){
    state = state.where((meal2) => meal2.id!=meal.id).toList();
    return false; 
  }else{
    state = [...state, meal];
    return true; 
  }
  state = []; 
}
}

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, List<Meal>>((ref){
  return FavouriteNotifier();
}); 