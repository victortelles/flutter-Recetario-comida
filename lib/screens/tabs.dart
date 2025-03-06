import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/models/meal.dart';
import 'package:tarea_10_recetario/screens/categories.dart';
import 'package:tarea_10_recetario/screens/meals.dart';
import 'package:tarea_10_recetario/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //Indice inicial pagina
  int _selectedPageIndex = 0;

  //Lista de favoritos
  List<Meal> _favoriteMeals = [];

  //Funcion para agregar o quitar fav.
  void _toggleFavorite(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);
    setState(() {
      if(isExisting){
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  //Lista de paginas
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(
        favoriteMeals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
      ),
      'title': 'Categories'},

      {'page': MealsScreen(
        categoryId: 'favorites',
        categoryTitle: 'Your Favorites',
        favoriteMeals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
      ),
      'title': 'Your Favorites'},
    ];
  }

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
      //Sidebar
      drawer: MainDrawer(onSelectScreen: _selectPage),
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
