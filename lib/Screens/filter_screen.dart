import 'package:flutter/material.dart';

import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filter-screen";
  final Function saveFilters;
  final Map<String, bool> _currentFilters;

  FilterScreen(this._currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  initState() {
    _glutenFree = widget._currentFilters["gluten"] as bool;
    _vegetarian = widget._currentFilters["vegetarian"] as bool;
    _vegan = widget._currentFilters["vegan"] as bool;
    _lactoseFree = widget._currentFilters["lactose"] as bool;
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, bool value, String subTitle, Function(bool) onChange) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subTitle),
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Screen"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                    "Gluten-Free", _glutenFree, "Only Gluten Free Meals!",
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    "Vegetarian", _vegetarian, "Only Vegetarian Meals!",
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTile("Vegan", _vegan, "Only Vegan Meals!",
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchTile(
                    "Lactose-Free", _lactoseFree, "Only Lactose Free Meals!",
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.saveFilters({
            "gluten": _glutenFree,
            "lactose": _lactoseFree,
            "vegan": _vegan,
            "vegetarian": _vegetarian,
          });

          Navigator.of(context).popAndPushNamed("/");
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
