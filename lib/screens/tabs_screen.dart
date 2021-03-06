import 'package:Meals_App/screens/Favorite_screen.dart';
import 'package:Meals_App/screens/categories_screen.dart';
import 'package:Meals_App/screens/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {"page": CategoryScreen(), "title": "Category"},
    {"page": Favorite(), "title": "My favorites"}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Category")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Favorites"))
        ],
      ),
    );
  }
}
