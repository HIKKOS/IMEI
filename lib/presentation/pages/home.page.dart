import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:imei/config/themes/app_colors.dart';

const List<Map<String, dynamic>> icons = [
  {
    "icon": Iconsax.teacher,
    "category": "Educacion",
  }
];
const String name = 'Hikkos';
final List anuncios = [
  {
    "titulo": "Pantalla de notificaciones",
    "descripcion": "Icono de la campana -> pantalla de notificaciones",
    "imagen":
        "https://images.pexels.com/photos/1181734/pexels-photo-1181734.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  },
  {
    "titulo": "Anuncio 2",
    "descripcion": "Descripcion del anuncio 2",
    "imagen":
        "https://images.pexels.com/photos/3992948/pexels-photo-3992948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  }
];

final List<Map<String, dynamic>> data = [
  {
    "mes": 'enero',
    "pagos": [
      {
        "fecha_limite": DateTime(2021, 1, 15),
        "nombre": "Ingles",
        "categoria": "Educacion",
      },
      {
        "fecha_limite": DateTime(2021, 1, 18),
        "nombre": "Colegiatura",
        "categoria": "Educacion",
      }
    ]
  }
];

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: anuncios.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: size.width * 0.8,
                    child: Stack(
                      children: [
                        //put gradient over this widget
                        //put gradient over this widget

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ShaderMask(
                            blendMode: BlendMode.darken,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ).createShader(bounds);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                anuncios[index]["imagen"],
                                height: 200,
                                width: size.width * 0.8,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text.rich(
                            TextSpan(
                              text: anuncios[index]["titulo"] + "\n",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: anuncios[index]["descripcion"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Por pagar',
                        style: TextStyle(
                            color: LightColors.text,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data[index]["pagos"].length,
                    itemBuilder: (context, index2) {
                      final pago = data[index]["pagos"];
                      return Card(
                        child: ListTile(
                            leading: pago[index2]["categoria"] == "Educacion"
                                ? const Icon(Iconsax.teacher)
                                : const Icon(Iconsax.briefcase),
                            title: Text(pago[index2]["nombre"]),
                            subtitle: Text(
                                'Fecha limite: ${_buildDate(date: pago[index2]["fecha_limite"])}'),
                            trailing: IconButton(
                              icon: const Icon(
                                Iconsax.arrow_right_3,
                              ),
                              onPressed: () {},
                            )),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

String _buildDate({required DateTime date}) {
  return '${date.day}/${date.month}/${date.year}';
}
