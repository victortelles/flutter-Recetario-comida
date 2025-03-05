import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No hay favoritos aún.',
        style: TextStyle(
          fontSize: 24,
          color: Colors.amber
          ),
      ),
    );
  }
}
