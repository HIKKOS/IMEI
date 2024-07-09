import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:imei/config/themes/app_colors.dart';

const List<Map<String, dynamic>> icons = [
  {
    "icon": Iconsax.teacher,
    "title": "Informacion Personal",
    "subtitle": "Nombre, celular, direccion",
  },
  {
    "icon": Iconsax.lock,
    "title": "Correo y contraseña",
    "subtitle": "Inicio de sesion y seguridad",
  },
  {
    "icon": Iconsax.copy,
    "title": "Servicios activos",
    "subtitle": "Administra tus servicios",
  },
  {
    "icon": Iconsax.message_question,
    "title": "Contacto",
    "subtitle": "Ayuda y soporte",
  },
];
Map user = <String, dynamic>{
  "nombre": "Hikkos",
  "correo": "",
  "direccion": "Calle 123",
  "celular": "1234567890",
  "servicios": [
    {
      "nombre": "Ingles",
      "categoria": "Educacion",
    },
    {
      "nombre": "Colegiatura",
      "categoria": "Educacion",
    }
  ],
};
List menuItems = <Map<String, dynamic>>[
  {
    "icon": Iconsax.teacher,
    "title": "Informacion Personal",
    "subtitle": "Nombre, celular, direccion"
  }
];

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            child: SizedBox(
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  trailing: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: LightColors.primaryLight,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: const Icon(Iconsax.user,
                          color: LightColors.primary, size: 40)),
                  title: Text(
                    user['nombre']!,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 35, 35, 35)),
                  ),
                  subtitle: Text(
                    ' ${user['servicios']!.length} servicios activos',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: LightColors.greyText),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: icons.length,
            itemBuilder: (_, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
              child: Card(
                child: ListTile(
                    leading: Icon(icons[index]['icon'] as IconData,
                        color: LightColors.primary, size: 40),
                    title: Text(
                      icons[index]['title'] as String,
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 35, 35, 35)),
                    ),
                    subtitle: Text(
                      icons[index]['subtitle'] as String,
                      style: const TextStyle(
                          fontSize: 14, color: LightColors.greyText),
                    ),
                    onTap: () {
                      print('Tapped');
                    },
                    trailing: IconButton(
                      icon: const Icon(
                        Iconsax.arrow_right_3,
                      ),
                      onPressed: () {},
                    )),
              ),
            ),
            shrinkWrap: true,
          ),
        )
      ],
    );
  }
}
