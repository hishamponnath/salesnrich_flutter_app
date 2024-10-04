import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/view/inventory.dart';

class Settings_view extends StatefulWidget {
  const Settings_view({super.key});

  @override
  State<Settings_view> createState() => _Settings_viewState();
}

class _Settings_viewState extends State<Settings_view> {
  int _selectedValue = Common.selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 15),
                  child: Column(
                    children: [
                      const Text(
                        "Default Product Loading Form",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        title: const Text('Product Category'),
                        leading: Radio(
                          activeColor: Colors.blue[900],
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedValue = value!;
                              Common.selectedValue =
                                  _selectedValue; // Save in Common class
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Product Group'),
                        leading: Radio(
                          activeColor: Colors.blue[900],
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedValue = value!;
                              Common.selectedValue =
                                  _selectedValue; // Save in Common class
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
