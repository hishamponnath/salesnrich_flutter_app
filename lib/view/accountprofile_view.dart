import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/accountprofilemodel.dart';
import 'package:salesnrich_app_flutter/service/accountprofile_service.dart';

class AcoountProfile extends StatefulWidget {
  const AcoountProfile({super.key});

  @override
  State<AcoountProfile> createState() => _AcoountProfileState();
}

class _AcoountProfileState extends State<AcoountProfile> {
  final AccountprofileService _accountprofileService = AccountprofileService();
  List<AccountProfileModel> _accountProfiles = [];
  List<AccountProfileModel> _filteredProfiles = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchAccountProfiles();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search Accounts",
                border: OutlineInputBorder(),
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
                                  trailing: const Wrap(
                                    spacing: 12, // space between two icons
                                    children: <Widget>[
                                      Icon(
                                        Icons.call,
                                      ), // icon-1
                                      Icon(Icons.location_on), // icon-2
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
