import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/menuitemsmodel.dart';
import 'package:salesnrich_app_flutter/service/menuitems_service.dart';
import 'package:salesnrich_app_flutter/view/attendancescreen_view.dart';
import 'package:salesnrich_app_flutter/view/punchoutscreen_view.dart';

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
            itemCount: menuItemsList.length + 1, // +1 for the DrawerHeader
            itemBuilder: (context, index) {
              if (index == 0) {
                // DrawerHeader
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 43, 63),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[800],
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Hisham',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'h919216@gmail.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                Menuitems menuItem = menuItemsList[index - 1];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4.0,
                  color: const Color.fromARGB(255, 135, 167, 193),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      child: Icon(
                        menuIcons[(index - 1) % menuIcons.length],
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      menuItem.label ?? 'No Label',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to the appropriate screen based on the menu item
                      if (menuItem.label == 'Attendance') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen()),
                        );
                      } else if (menuItem.label == 'Punch Out') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PunchOutScreen()),
                        );
                      }
                      // Add more conditions here for other menu items if needed
                    },
                  ),
                );
              }
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
