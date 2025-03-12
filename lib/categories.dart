import 'package:flutter/material.dart';
import 'package:meals_app/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_grid_item.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.status, required this.availableMeals});
  final void Function(Meal meal) status; 
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id),).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> Meals(title: category.title, meals: filteredMeals, status: status,),),);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
            children:[
              for(final category in availableCategories)
                CategoryGridItem(category: category, onSelectedCategory: (){_selectCategory(context, category );}), 
                //or availableCategories.map((category) => CategoryGridItem(category)).toList()
            ],
      ),
    );
  }
}
