import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/data/dummy_data.dart';
import 'package:tarea_10_recetario/models/meal.dart';
import 'package:tarea_10_recetario/widgets/meal_item.dart';
import 'package:tarea_10_recetario/widgets/meal_item_trait.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final List<Meal> favoriteMeals;

  const MealsScreen({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
    required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    //Filtrar los platillos por categoria
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    //toggle para intercambiar favoritos o categorias
    final mealsToShow =
        categoryId == 'favorites' ? favoriteMeals : filteredMeals;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),

      //Si se encuentra vacio
      body: mealsToShow.isEmpty
          ? const Center(
              child: Text(
                'No hay platillos disponibles.',
                style: TextStyle(fontSize: 24, color: Colors.amber),
              ),
            )

      //Si no esta vacio
          : ListView.builder(
              itemCount: mealsToShow.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: mealsToShow[index],
                  onSelectMeal: () {
                    // Aquí se llamará la función para abrir los detalles del platillo
                  },
                );
              },
            ),
    );
  }
}
