import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/inventorymodel.dart';
import 'package:salesnrich_app_flutter/service/inventory_service.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  // List of items in the dropdowns
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // Separate selected item variables for each dropdown
  String? _selectedItemDropdown1;
  String? _selectedItemDropdown2;
  final TextEditingController _searchController = TextEditingController();

  final InventoryService _inventoryService = InventoryService();

  @override
  void initState() {
    _inventoryService.getAllInventory();
    super.initState();
  }

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

      drawer: const Drawer(child: Drawerclass()), // Add your custom drawer here
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              width:
                  MediaQuery.of(context).size.width, // Set width to full screen
              child: DropdownButton<String>(
                hint:
                    const Text('Select an item'), // Hint text for the dropdown
                value:
                    _selectedItemDropdown1, // Currently selected item for the first dropdown
                isExpanded: true, // Make the dropdown take full width
                items: _items.map((String item) {
                  // Mapping the list of items to DropdownMenuItems
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handling item selection for the first dropdown
                  setState(() {
                    _selectedItemDropdown1 = newValue;
                  });
                },
                icon: const Icon(
                    Icons.arrow_downward), // Custom icon for the dropdown
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.width, // Set width to full screen
              child: DropdownButton<String>(
                hint:
                    const Text('Select an item'), // Hint text for the dropdown
                value:
                    _selectedItemDropdown2, // Currently selected item for the second dropdown
                isExpanded: true, // Make the dropdown take full width
                items: _items.map((String item) {
                  // Mapping the list of items to DropdownMenuItems
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handling item selection for the second dropdown
                  setState(() {
                    _selectedItemDropdown2 = newValue;
                  });
                },
                icon: const Icon(
                    Icons.arrow_downward), // Custom icon for the dropdown
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Price Level :",
              style: TextStyle(fontSize: 18),
            ),
          ),
          // Row to include search bar and filter button
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
                    // Add filter functionality here
                    print("Filter button pressed");
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  color: Colors.grey,
                  child: FutureBuilder(
                      future: _inventoryService.getAllInventory(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<inventorymodel> inventory = snapshot.data!;

                          return ListView.builder(
                              itemCount: inventory.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(inventory[index].name!),
                                  ),
                                );
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
