import 'package:flutter/material.dart';
import 'package:recipes/screens/settings_Screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26, color: Colors.pink[900]),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.pink[900], fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.pink[900],
          child: Text(
            'Cooking Up !',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Settings', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
        }),
      ]),
    );
  }
}
