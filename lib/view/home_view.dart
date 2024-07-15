import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/documentsmodel.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:salesnrich_app_flutter/service/documents_service.dart';

class homescreen extends StatefulWidget {
  final UserModel? user;
  const homescreen({super.key, this.user});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final DocumentsService _documentsService = DocumentsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 167, 193),
        title: const Text("Hisham"),
      ),
      drawer: const Drawer(),
      body: FutureBuilder(
          future: _documentsService.getalldocumets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentsModel> documentList = snapshot.data!;
              documentList;

              return ListView.builder(
                itemCount: documentList.length,
                itemBuilder: (context, index) {
                  DocumentsModel document = documentList[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4.0,
                    color: const Color.fromARGB(255, 135, 167, 193),
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.book)),
                      title: Text(
                        document.name ?? 'No Name',
                        style: const TextStyle(
                            color: Colors.white), // White text color
                      ),
                      subtitle: Text(
                        document.description ?? 'No Description',
                        style: const TextStyle(
                            color: Colors.white), // White text color
                      ),
                    ), // Optional: change card background color
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
              // child: Text("${widget.user!.idToken}"),
            );
          }),
    );
  }
}
