import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:salesnrich_app_flutter/model/accountprofilemodel.dart';
import 'package:salesnrich_app_flutter/model/territoriesmodel.dart';
import 'package:salesnrich_app_flutter/service/accountprofile_service.dart';
import 'package:salesnrich_app_flutter/service/territories_service.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  final AccountprofileService _accountprofileService = AccountprofileService();
  final TerritoryService _territoryService = TerritoryService();
  List<AccountProfileModel> _accountProfiles = [];
  List<AccountProfileModel> _filteredProfiles = [];
  List<TerritoryModel> _territoryList = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  bool _hasError = false;
  TerritoryModel? _selectedTerritory;

  @override
  void initState() {
    super.initState();
    _fetchAccountProfiles();
    _fetchTerritoriesData();
    _searchController.addListener(_filterProfiles);
  }

  Future<void> _fetchAccountProfiles() async {
    try {
      List<AccountProfileModel> profiles =
          await _accountprofileService.getallaccountprofiles();
      setState(() {
        _accountProfiles = profiles;
        _filteredProfiles = profiles;
        _isLoading = false;
      });
    } catch (error) {
      print("Error fetching account profiles: $error");
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchTerritoriesData() async {
    try {
      List<TerritoryModel>? territoryList =
          await _territoryService.getAllTerritories();
      setState(() {
        _territoryList = territoryList ?? [];
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _filterProfiles() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProfiles = _accountProfiles.where((profile) {
        return profile.name != null &&
            profile.name!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: const Text(
          "Account profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const Drawer(
        child: Drawerclass(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                fillColor: Colors.black38,
                filled: true,
                hintText: "Search Accounts",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _territoryList.isEmpty
                ? const CircularProgressIndicator()
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButton<TerritoryModel>(
                      isExpanded: true,
                      hint: const Text("Select Territory"),
                      value: _selectedTerritory,
                      items: _territoryList.map((TerritoryModel territory) {
                        return DropdownMenuItem<TerritoryModel>(
                          value: territory,
                          child: Text(territory.name ?? "No Name"),
                        );
                      }).toList(),
                      onChanged: (TerritoryModel? newValue) {
                        setState(() {
                          _selectedTerritory = newValue;
                        });
                      },
                      underline: const SizedBox
                          .shrink(), // Remove the default underline
                    ),
                  ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _hasError
                    ? const Center(child: Text('Error fetching data'))
                    : _filteredProfiles.isEmpty
                        ? const Center(child: Text('No profiles found'))
                        : ListView.builder(
                            itemCount: _filteredProfiles.length,
                            itemBuilder: (context, index) {
                              AccountProfileModel account =
                                  _filteredProfiles[index];
                              return Card(
                                margin: const EdgeInsets.all(8.0),
                                elevation: 4.0,
                                color: const Color.fromARGB(255, 135, 167, 193),
                                child: ListTile(
                                  title: Text(
                                    account.name ?? "No Name",
                                    style: const TextStyle(
                                        color:
                                            Colors.white), // White text color
                                  ),
                                  subtitle: Text(
                                    account.phone1.toString(),
                                    style: const TextStyle(
                                        color:
                                            Colors.white), // White text color
                                  ),
                                  trailing: Wrap(
                                    spacing: 12, // space between two icons
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () async {
                                            FlutterPhoneDirectCaller.callNumber(
                                                account.phone1);
                                          },
                                          icon: const Icon(Icons.call)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.location_on)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {}),
    );
  }
}
