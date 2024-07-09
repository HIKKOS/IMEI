import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:imei/config/themes/app_colors.dart';
import 'package:imei/presentation/widgets/marquee.dart';

const List<Map<String, dynamic>> icons = [
  {
    "icon": Iconsax.money,
    "title": "Pago pendiente",
    "subtitle": "\$600 por pagar antes del 15 de enero",
    "severity": "high",
  },
  {
    "icon": Iconsax.book,
    "title": "Conferencia sobre salud íntima",
    "subtitle": "Este viernes 20 de enero",
    "severity": "low",
  }
];
Widget IconBuilder(IconData icon, String severity) {
  Color color;
  if (severity == 'high') {
    color = LightColors.red;
  } else if (severity == 'low') {
    color = LightColors.green;
  } else {
    color = LightColors.primary;
  }
  return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: 50,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.3)),
      child: Center(child: Icon(icon, color: color, size: 30)));
}

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notificaciones'),
        ),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (_, index) => Card(
                child: ListTile(
                    leading: IconBuilder(icons[index]['icon'] as IconData,
                        icons[index]['severity'] as String),
                    title: Text(
                      icons[index]['title'] as String,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color.fromARGB(255, 35, 35, 35)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Marquee(
                        child: Text(
                          icons[index]['subtitle'] as String,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 14, color: LightColors.greyText),
                        ),
                      ),
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
              shrinkWrap: true,
            ),
          ),
        ));
  }

  Widget listView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return listViewItem(index);
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0);
        },
        itemCount: 3);
  }

  Widget listViewItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
      child: Icon(Icons.notifications, size: 25, color: Colors.grey.shade700),
    );
  }

  Widget message(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: 'Message',
            style: TextStyle(
                fontSize: textSize,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            children: const [
              TextSpan(
                  text: 'Message Descript',
                  style: TextStyle(fontWeight: FontWeight.w400))
            ]),
      ),
    );
  }

  Widget timeAndDate(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: const Row(
        children: [
          Text(
            '03-07-2024',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '18:00',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
