import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/screens/categories.dart';
//import 'package:tarea_10_recetario/screens/meals.dart';
//import 'package:tarea_10_recetario/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //Indice inicial pagina
  int _selectedPageIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    //{'page': const MealsScreen(), 'title': 'Your Favorites'},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Esqueleto
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: const Drawer(),
      body: _pages[_selectedPageIndex]['page'],

      //bottomNavigation bar (cat | Fav)
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          //Opc1: Categorias
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          //Opc2: Favoritos
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Your Favorites',
          ),
        ],
      ),
    );
  }
}
