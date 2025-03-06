import 'package:flutter/material.dart';
import 'package:meals_app/meals.dart';
import 'package:meals_app/screens/category_grid_item.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id),).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> Meals(title: category.title, meals: filteredMeals,),),);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
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
