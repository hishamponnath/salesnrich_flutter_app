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

  @override
  void initState() {
    _accountprofileService.getallaccountprofiles();
    super.initState();
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
          Expanded(
            child: FutureBuilder(
              future: _accountprofileService.getallaccountprofiles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<AccountProfileModel> accountprofileList = snapshot.data!;
                  return ListView.builder(
                    itemCount: accountprofileList.length,
                    itemBuilder: (context, index) {
                      AccountProfileModel account = accountprofileList[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 4.0,
                        color: const Color.fromARGB(255, 135, 167, 193),
                        child: ListTile(
                          title: Text(
                            account.name ?? "No Name",
                            style: const TextStyle(
                                color: Colors.white), // White text color
                          ),
                          subtitle: Text(
                            account.phone1.toString(),
                            style: const TextStyle(
                                color: Colors.white), // White text color
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
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
