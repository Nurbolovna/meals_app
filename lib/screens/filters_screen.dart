import 'package:flutter/material.dart';
import 'package:meals_app/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter; 

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFilter = false;
  var _veganFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilter[Filter.lactoseFree]!;
    _vegetarianFilter = widget.currentFilter[Filter.vegetarian]!;
    _veganFilter = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
         if(didPop) return;
        Navigator.of(context).pop({
        Filter.glutenFree: _glutenFreeFilter,
        Filter.lactoseFree: _lactoseFreeFilter,
        Filter.vegetarian: _vegetarianFilter,
        Filter.vegan: _veganFilter,
      });
    },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
             SwitchListTile(
              value: _vegetarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilter = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
                SwitchListTile(
              value: _veganFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
