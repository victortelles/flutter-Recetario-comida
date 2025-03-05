import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  //Funcion que recibe para cambiar pantalla
  final Function(int) onSelectScreen;

  const MainDrawer({super.key, required this.onSelectScreen});

  //Constructor para ListTile + navegacion
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    //Widget ListTile (Icono + Titulo)
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Drawer
    return Drawer(
      child: Column(
        children: [
          AppBar(
            //Titulo menu hamburgesa
            title: const Text('Recetario de Cocina'),
            //icono hamburgesa false
            automaticallyImplyLeading: false,
          ),

          //Lista 1
          buildListTile('Categories', Icons.set_meal, () {
            Navigator.pop(context);
            onSelectScreen(0);
          }),

          //Lista 2
          buildListTile('Your Favorites', Icons.star, () {
            Navigator.pop(context);
            onSelectScreen(1);
          }),
        ],
      ),
    );
  }
}

