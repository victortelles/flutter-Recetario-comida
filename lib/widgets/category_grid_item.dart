import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/models/category.dart';

//Constructor
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {
        super.key,
        required this.category,
        required this.onSelectCategory
      }
  );

  //informacion que obtiene (titulo, color)
  final Category category;

  // Funcion que se ejecuta cuando se toca un elemento
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    //Contenedor principal
    return GestureDetector(
      onTap: onSelectCategory,
      child: Container(
        //Espaciado
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          //Degradado al contenedor
          gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.6),
                category.color.withOpacity(0.9)
              ],
              //Inicia / finaliza (Arriba izq - Abajo Der.)
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),

          //Color y bordeado
          color: category.color,
          borderRadius: BorderRadius.circular(15),
        ),

        //Titulo
        alignment: Alignment.topLeft,
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
