// inventory_view.dart

import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/view/inventory.dart';


class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  // Example list of items for the dropdowns
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // Variables to hold selected dropdown items
  String? _selectedItemDropdown1;
  String? _selectedItemDropdown2;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Vansales",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Doc Name",
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Doc No",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                hint: const Text('Select an item'),
                value: _selectedItemDropdown1,
                isExpanded: true,
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItemDropdown1 = newValue;
                  });
                },
                icon: const Icon(Icons.arrow_downward),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                hint: const Text('Select an item'),
                value: _selectedItemDropdown2,
                isExpanded: true,
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItemDropdown2 = newValue;
                  });
                },
                icon: const Icon(Icons.arrow_downward),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Price Level:",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Product',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list), // Filter icon
                  onPressed: () {
                    // Show dialog based on selected radio button
                    if (Common.selectedValue == 1) {
                      _showProductCategoryDialog(); // Show Product Category dialog
                    } else if (Common.selectedValue == 2) {
                      _showProductGroupDialog(); // Show Product Group dialog
                    }
                  },
                ),
              ],
            ),
          ),
          // Example inventory list (can be replaced with a FutureBuilder fetching data from API)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  itemCount: 10, // Example length, can be dynamic based on data
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("Product ${index + 1}"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog for Product Group
  void _showProductGroupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Product Group'),
          content: const Text('This is the Product Group dialog.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Dialog for Product Category with yellow background
  void _showProductCategoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow[100], // Yellow background
          title: const Text('Product Category'),
          content: const Text('This is the Product Category dialog.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
