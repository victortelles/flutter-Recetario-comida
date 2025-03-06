import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  final Meal meal;
  //Toggle de favorito
  final Function(Meal) onToggleFavorite;
  final bool isFavorite;

  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //Equeleto
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          //Estrella de fav
          IconButton(
            icon: Icon(
              widget.isFavorite ? Icons.star : Icons.star_border,
              color: widget.isFavorite ? Colors.amber : Colors.white,
            ),

            //Funcionalidad
            onPressed: () {
              widget.onToggleFavorite(widget.meal);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        //Columna
        child: Column(
          children: [
            Image.network(widget.meal.imageUrl),

            //Padding
            Padding(
              padding: const EdgeInsets.all(10),
              //Columna
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                //Titulo
                  Text(
                    'Ingredients:',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent
                      ),
                  ),

                  //Contenido de data
                  ...widget.meal.ingredients
                      .map((ingredient) => Text(
                        ingredient,
                        style: const TextStyle(color: Colors.white),
                      )).toList(),

                  //Espaciado
                  const SizedBox(height: 10),

                  //Titulo
                  Text(
                    'Steps:',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent
                      ),
                  ),

                  //Contenido de data
                  ...widget.meal.steps.map((step) => Text(
                    step,
                    style: const TextStyle(color:Colors.white),
                  )).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
