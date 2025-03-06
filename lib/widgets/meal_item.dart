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
    //InkWell = Clickeable el contenedor
    return InkWell(
      onTap: onSelectMeal,
      //Card
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        //Elevarlo poco
        elevation: 4,

        //Stack
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
              //Contenedor
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  //Borde redondeado
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                //1ra Columna
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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

                    //Fila
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //Op1
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),

                        //Espaciado
                        SizedBox(width: 12,),

                        //Op2
                        MealItemTrait(
                          icon: Icons.work,
                          label: meal.complexity.name.toUpperCase(),
                        ),

                        //Espaciado
                        SizedBox(width: 12,),

                        //Op3
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: meal.affordability.name.toUpperCase(),
                        ),

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