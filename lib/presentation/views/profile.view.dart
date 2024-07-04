import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

const List<Map<String, dynamic>> icons = [
  {
    "icon": Iconsax.teacher,
    "title": "Informacion Personal",
    "subtitle": "Nombre, celular, direccion",
  },
  {
    "icon": Iconsax.teacher,
    "title": "Correo y contraseña",
    "subtitle": "Inicio de sesion y seguridad",
  },
  {
    "icon": Iconsax.teacher,
    "title": "Servicios activos",
    "subtitle": "Administra tus servicios",
  },
  {
    "icon": Iconsax.teacher,
    "title": "Contacto",
    "subtitle": "Ayuda y soporte",
  },
];

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          actions: [
            IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {},
            ),
          ],
          title: const Text('Perfil'),
        ),
        body: Card(
          child: SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.4,
            child: const ListTile(
              trailing: Icon(Iconsax.user),
              title: Text('Nombre'),
              subtitle: Text('3 servicios contratados'),
            ),
          ),
        ));
  }
}
