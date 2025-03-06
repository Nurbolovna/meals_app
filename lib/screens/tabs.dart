import 'package:flutter/material.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/meals.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0; 
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = Categories();
    String activePageTitle = "Categories"; 
  
    if(_selectedPageIndex == 1){
      activePage = Meals( meals: [],);
      activePageTitle = "Your Favourites"; 
  
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
