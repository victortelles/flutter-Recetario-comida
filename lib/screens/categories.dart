import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/models/meal.dart';
import 'package:tarea_10_recetario/screens/meals.dart';
import 'package:tarea_10_recetario/widgets/category_grid_item.dart';
import 'package:tarea_10_recetario/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Function(Meal) onToggleFavorite;

  const CategoriesScreen({
    super.key,
    required this.favoriteMeals,
    required this.onToggleFavorite,
    });

  //Funcionalidad al seleccionar categoria
  void _selectCategory(BuildContext context, String categoryId, String categoryTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          categoryId: categoryId,
          categoryTitle: categoryTitle,
          favoriteMeals: favoriteMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //GridView
      body: GridView(
        //Espaciado
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //Dividirlo 2 columas
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

        //Mostrar categorías
        children: [
          // Itera sobre las categorías disponibles
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(
                context,
                category.id,
                category.title,
              ),
            ),
        ],
      ),
    );
  }
}