import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_item.dart';
import 'package:meals_app/screens/meals_details.dart';
//import 'package:meals_app/data/dummy_data.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals, required this.status});

  final String?title;
  final List<Meal> meals;
  final void Function(Meal meal) status;

  void _selectMeal(BuildContext context, Meal meal) {
    // final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(meal.id),).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsDetails(meal: meal, status: status,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectedMeal: (meal) {
          _selectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Try selecting a different category please!')
        ],
      ));
    }
    if(title == null){
      return content; 
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
