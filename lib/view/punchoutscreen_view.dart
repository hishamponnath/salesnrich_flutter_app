import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';

class PunchOutScreen extends StatelessWidget {
  const PunchOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Punch Out"),
      ),
      drawer: const Drawer(child: Drawerclass()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Punch Out",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 160),
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
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: const Text("View"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: const Text("PunchOut"),
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
            SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                ),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
