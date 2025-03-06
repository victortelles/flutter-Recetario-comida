import 'package:flutter/material.dart';

//Widget para auxiliar los iconos y textos
class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    //Fila
    return Row(
      children: [
        //Icono
        Icon(icon, color: Colors.white),
        //Espaciado
        const SizedBox(width: 8),
        //Texto
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
