import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/data/dummy_data.dart';
import 'package:tarea_10_recetario/models/meal.dart';
import 'package:tarea_10_recetario/screens/meal_details.dart';
import 'package:tarea_10_recetario/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final List<Meal> favoriteMeals;
  final Function(Meal) onToggleFavorite;

  const MealsScreen({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
    required this.favoriteMeals,
    required this.onToggleFavorite,
  });


  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    final mealsToShow =
        categoryId == 'favorites' ? favoriteMeals : filteredMeals;

    //Esqueleto
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: mealsToShow.isEmpty

          //Vacio
          ? const Center(
              child: Text(
                'No hay platillos disponibles.',
                style: TextStyle(fontSize: 24, color: Colors.amber),
              ),
            )

          // Si no esta vacio
          : ListView.builder(
              itemCount: mealsToShow.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: mealsToShow[index],
                  onSelectMeal: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MealDetailsScreen(
                          meal: mealsToShow[index],
                          isFavorite: favoriteMeals.contains(mealsToShow[index]),
                          onToggleFavorite: onToggleFavorite,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}