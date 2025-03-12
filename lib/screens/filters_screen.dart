import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersState();
  }
}

  class _FiltersState extends State<FiltersScreen>{
    var _glutenFreeFilter = false;


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilter,
          onChanged: (isChecked){
            setState(() {
              _glutenFreeFilter = isChecked; 
            });
          }, 
          title: Text('Gluten-free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
                  ),
                  subtitle:  Text('Only include gluten-free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
                  ),
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  contentPadding: EdgeInsets.only(left: 34, right: 22),

      ),],
      ),
    );
  }
  }