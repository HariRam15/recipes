import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipes/screens/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  //this is its(Class) own route Name
  static const routeName = '/settings';

  final Function saveSettings;
  final Map<String, bool> currentSettings;

  SettingsScreen(this.currentSettings, this.saveSettings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  // @override
  // initState() {
  //   _glutenFree = widget.currentSettings['gluten'];
  //   _lactoseFree = widget.currentSettings['lactose'];
  //   _vegan = widget.currentSettings['vegan'];
  //   _vegetarian = widget.currentSettings['vegetarian'];
  //   super.initState();
  // }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        value: currentValue,
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedSettings = {
                  'glueten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveSettings(selectedSettings);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free',
                    'Only Includes Gluten-Free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free',
                    'Only Includes Lactose-Free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only Includes Vegetarianmeals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only Includes Vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
