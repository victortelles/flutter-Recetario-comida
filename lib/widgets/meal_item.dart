import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/models/meal.dart';
import 'package:tarea_10_recetario/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final VoidCallback onSelectMeal;

  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectMeal,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        elevation: 4,
        child: Stack(
          children: [
            //Imagen de fondo
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            //Rectangulo con opacidad
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.black.withOpacity(0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Titulo
                    Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //Espaciado
                    const SizedBox(height: 5),

                    //3 filas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: meal.complexity.name.toUpperCase(),
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: meal.affordability.name.toUpperCase(),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}