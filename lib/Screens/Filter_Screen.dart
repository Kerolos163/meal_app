import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  Function func;
  Map<String, bool> mapfilter;
  static const filterRout = "Filter";
  FilterScreen(this.func, this.mapfilter);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  void initState() {
    isGlutenFree = widget.mapfilter['Gluten'] as bool;
    isLactoseFree = widget.mapfilter['lactose'] as bool;
    isVegan = widget.mapfilter['Vegan'] as bool;
    isVegetarian = widget.mapfilter['Vegetarian'] as bool;
    super.initState();
  }

  Widget Buildswitchlisttitle( bool val, String tit, String SubTit, Function func) {
    return SwitchListTile(
      value: val,
      onChanged: func as void Function(bool),
      title: Text(
        tit,
      ),
      subtitle: Text(SubTit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> SelectedFilter = {
                  'Gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'Vegan': isVegan,
                  'Vegetarian': isVegetarian,
                };
                widget.func(SelectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Buildswitchlisttitle(
                  isGlutenFree, "Gluten Free", "only include Gluten Free meals",
                  (value) {
                setState(() {
                  isGlutenFree = value;
                });
              }),
              Buildswitchlisttitle(isLactoseFree, "Lactose Free",
                  "only include Lactose Free meals", (value) {
                setState(() {
                  isLactoseFree = value;
                });
              }),
              Buildswitchlisttitle(isVegan, "Vegan", "only include Vegan meals",
                  (value) {
                setState(() {
                  isVegan = value;
                });
              }),
              Buildswitchlisttitle(
                  isVegetarian, "Vegetarian", "only include Vegetarian meals",
                  (value) {
                setState(() {
                  isVegetarian = value;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
