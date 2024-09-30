import 'package:flutter/material.dart';
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

  // TextEditingController for the search bar
  final TextEditingController _searchController = TextEditingController();

  // List of items filtered based on search query
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all items
    _filteredItems = _items;

    // Listen to search bar input and filter items
    _searchController.addListener(() {
      filterItems();
    });
  }

  void filterItems() {
    setState(() {
      _filteredItems = _items
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Doc No",
              style: TextStyle(fontSize: 20),
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
                items: _filteredItems.map((String item) {
                  // Mapping the filtered list of items to DropdownMenuItems
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
                items: _filteredItems.map((String item) {
                  // Mapping the filtered list of items to DropdownMenuItems
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.amberAccent,
                child: Column(
                  children: [
                    // Search bar inside the yellow box
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          labelText: 'Search items',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                    // List of items inside the yellow box
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            _filteredItems.length, // Use filtered items count
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                                Icons.person), // Icon at the start of the tile
                            title: Text(
                                _filteredItems[index]), // Display filtered item
                            subtitle: const Text(
                                'This is a subtitle'), // Subtitle below the title
                            trailing: const Icon(Icons
                                .arrow_forward), // Icon at the end of the tile
                            onTap: () {
                              // Handle tap event
                              print('Tapped on item ${_filteredItems[index]}');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
