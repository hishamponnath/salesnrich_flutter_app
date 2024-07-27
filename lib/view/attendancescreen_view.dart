import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Attendance"),
      ),
      drawer: const Drawer(child: Drawerclass()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Attendance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4, // Shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Attendance Status",
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: "PRESENT", child: Text("PRESENT")),
                          DropdownMenuItem(
                              value: "LEAVE/OFF", child: Text("LEAVE/OFF")),
                        ],
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                          height: 180), // Space between Dropdown and TextField
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Your Remarks",
                        ),
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: const Text("View"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
            ),
            SizedBox(width: 8), // Reduced space between buttons
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: const Text("Send"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
            ),
            SizedBox(width: 8), // Reduced space between buttons
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 20, // Adjusted icon size
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(
                      8.0), // Added padding to ensure icon is centered
                ),
              ),
            ),
            SizedBox(width: 8), // Reduced space between buttons
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20, // Adjusted icon size
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(
                      8.0), // Added padding to ensure icon is centered
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
