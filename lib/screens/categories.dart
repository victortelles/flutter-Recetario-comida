import 'package:flutter/material.dart';
import 'package:tarea_10_recetario/widgets/category_grid_item.dart';
import 'package:tarea_10_recetario/models/category.dart';
import 'package:tarea_10_recetario/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona una categoría'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // Itera sobre las categorías disponibles
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {

              },
            ),
        ],
      ),
    );
  }
}