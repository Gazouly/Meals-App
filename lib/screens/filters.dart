import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.setFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegan;
  bool _vegetarian;
  bool _lactoseFree;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _switchBuilder({
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: (value) => updateValue(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Filter Meals'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _switchBuilder(
                  title: 'Gluten-free',
                  subtitle: 'Include only gluten-free meals.',
                  currentValue: _glutenFree,
                  updateValue: (value) {
                    setState(() {
                      _glutenFree = value as bool;
                    });
                  },
                ),
                _switchBuilder(
                  title: 'Lactose-free',
                  subtitle: 'Include only lactose-free meals.',
                  currentValue: _lactoseFree,
                  updateValue: (value) {
                    setState(() {
                      _lactoseFree = value as bool;
                    });
                  },
                ),
                _switchBuilder(
                  title: 'Vegan',
                  subtitle: 'Include only vegan meals.',
                  currentValue: _vegan,
                  updateValue: (value) {
                    setState(() {
                      _vegan = value as bool;
                    });
                  },
                ),
                _switchBuilder(
                  title: 'Vegetarian',
                  subtitle: 'Include only vegetarian meals.',
                  currentValue: _vegetarian,
                  updateValue: (value) {
                    setState(() {
                      _vegetarian = value as bool;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
