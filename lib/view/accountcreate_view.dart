import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';

class Accountprofilecreate extends StatefulWidget {
  const Accountprofilecreate({super.key});

  @override
  State<Accountprofilecreate> createState() => _AccountprofilecreateState();
}

class _AccountprofilecreateState extends State<Accountprofilecreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      drawer: const Drawer(
        child: Drawerclass(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Customer/Company Name",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Alias", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "GST", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Description", border: OutlineInputBorder()),
              ),
            ),
            DemoDropDown(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Address", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "City", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Location", border: OutlineInputBorder()),
              ),
            ),
            MyDropdownWidget(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Pincode", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "District", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "State", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone 1", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone 2", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email 1", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email 2", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Contact Person Details :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Name , Designation",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Do u  have any Business Partner",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "How much is your monthly turnover",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Do u have any other branches",
                    border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDropdownWidget extends StatefulWidget {
  const MyDropdownWidget({super.key});

  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String? selectedValue;
  List<String> items = ["1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButton<String>(
          isExpanded: true,
          hint: const Text("-Select Territory (Route)--"),
          value: selectedValue,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          underline: const SizedBox.shrink(), // Remove the default underline
        ),
      ),
    );
  }
}

class DemoDropDown extends StatefulWidget {
  const DemoDropDown({super.key});

  @override
  _DemoDropDownState createState() => _DemoDropDownState();
}

class _DemoDropDownState extends State<DemoDropDown> {
  String? selectedValue;
  List<String> items = ["1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Sundry Debtors"),
          value: selectedValue,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          underline: const SizedBox.shrink(), // Remove the default underline
        ),
      ),
    );
  }
}
