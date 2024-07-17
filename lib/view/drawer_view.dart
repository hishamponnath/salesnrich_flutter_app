import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/menuitemsmodel.dart';
import 'package:salesnrich_app_flutter/service/menuitems_service.dart';

class Drawerclass extends StatefulWidget {
  const Drawerclass({super.key});

  @override
  State<Drawerclass> createState() => _DrawerclassState();
}

class _DrawerclassState extends State<Drawerclass> {
  final MenuitemsService _menuitemsService = MenuitemsService();
  @override
  Widget build(BuildContext context) {
    final List<IconData> menuIcons = [
      Icons.home,
      Icons.fingerprint,
      Icons.send_outlined,
      Icons.send_outlined,
      Icons.outbox,
      Icons.edit_calendar,
      Icons.lightbulb_sharp,
      Icons.map,
      Icons.notification_important,
      Icons.rotate_left,
      Icons.cleaning_services,
      Icons.settings,
      Icons.exit_to_app,
      Icons.web,
      Icons.gps_fixed,
      Icons.fingerprint,
      Icons.details_sharp,
      Icons.edit_calendar,
      Icons.send_outlined,
      Icons.account_box,
      Icons.extension,
      Icons.feedback,
      Icons.document_scanner,
      Icons.file_copy,
      Icons.switch_account_rounded,
    ];
    return FutureBuilder(
      future: _menuitemsService.getAllMenuItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Menuitems> menuItemsList = snapshot.data!;
          return ListView.builder(
            itemCount: menuItemsList.length,
            itemBuilder: (context, index) {
              Menuitems menuItem = menuItemsList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4.0,
                color: const Color.fromARGB(255, 135, 167, 193),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    child: Icon(
                      menuIcons[index % menuIcons.length],
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    menuItem.label ?? 'No Label',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}