import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/data/dummy_data.dart';
import 'package:tarea_10_recetario/models/meal.dart';
import 'package:tarea_10_recetario/screens/meal_details.dart';
import 'package:tarea_10_recetario/widgets/meal_item_trait.dart';
import 'package:tarea_10_recetario/widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
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
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal> favoriteMeals = [];

  //Funcion para intercambiar el boton de favoito.
  void _toggleFavorite(Meal meal) {
    setState(() {
      if(favoriteMeals.contains(meal)){
        favoriteMeals.remove(meal);
      } else {
        favoriteMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(widget.categoryId);
    }).toList();

    final mealsToShow =
        widget.categoryId == 'favorites' ? widget.favoriteMeals : filteredMeals;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: mealsToShow.isEmpty
          ? const Center(
              child: Text(
                'No hay platillos disponibles.',
                style: TextStyle(fontSize: 24, color: Colors.amber),
              ),
            )
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
                          onToggleFavorite: _toggleFavorite,
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
