import 'package:flutter/material.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/main_drawer.dart';
import 'package:meals_app/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/filters_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  final List<Meal> _favouriteMeals = []; 

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);

  }

 void _Status(Meal meal){
  final isExisting = _favouriteMeals.contains(meal); 

  if(isExisting){
    setState(() {
    _favouriteMeals.remove(meal);
    });
    _showInfoMessage("Removed from the favourite list");
   
  }
  else{
    setState(() {
    _favouriteMeals.add(meal);
    });
    _showInfoMessage("Added to the favourite list");
  }
}


  int _selectedPageIndex = 0; 
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index; 
    });
  }

  void _setScreen(String identifier){
    if(identifier == "filters"){
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FiltersScreen(),),);
    }
    else{
      Navigator.of(context).pop();
    }
  }


  @override
  Widget build(BuildContext context) {
    Widget activePage = Categories(status: _Status,);
    String activePageTitle = "Categories"; 
  
    if(_selectedPageIndex == 1){
      activePage = Meals( meals: _favouriteMeals, status: _Status,);
      activePageTitle = "Your Favourites"; 
  
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
           BottomNavigationBarItem(
              icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
