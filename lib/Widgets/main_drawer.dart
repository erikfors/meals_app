import 'package:flutter/material.dart';

import '../Screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData iconData, BuildContext context, String route) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => Navigator.of(context).pushReplacementNamed(route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant,context,"/"),
          buildListTile("Settings", Icons.settings,context,FilterScreen.routeName),
        ],
      ),
    );
  }
}
