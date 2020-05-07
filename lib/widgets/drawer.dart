import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget listItem({IconData icon, String text, String routeName}) {
      return ListTile(
        onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
        leading: Icon(icon),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            color: Theme.of(context).accentColor,
            child: Text(
              'DeliMeal App',
              style: TextStyle(
                fontSize: 26,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listItem(
            icon: Icons.restaurant,
            text: 'Categories and Meals',
            routeName: '/',
          ),
          listItem(
            icon: Icons.filter_list,
            text: 'Filters',
            routeName: FiltersScreen.routeName,
          ),
        ],
      ),
    );
  }
}
