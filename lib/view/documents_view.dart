import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/documentsmodel.dart';
import 'package:salesnrich_app_flutter/service/documents_service.dart';
import 'package:salesnrich_app_flutter/view/accountprofile_view.dart';

class Documentsclass extends StatefulWidget {
  const Documentsclass({super.key});

  @override
  State<Documentsclass> createState() => _DocumentsclassState();
}

class _DocumentsclassState extends State<Documentsclass> {
  final DocumentsService _documentsService = DocumentsService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _documentsService.getalldocumets(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DocumentsModel> documentList = snapshot.data!;
          return ListView.builder(
            itemCount: documentList.length,
            itemBuilder: (context, index) {
              DocumentsModel document = documentList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4.0,
                color: const Color.fromARGB(255, 135, 167, 193),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AccountProfile()),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      child: const Icon(
                        Icons.book,
                        color: Colors.white,
                      )),
                  title: Text(
                    document.name ?? 'No Name',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    document.description ?? 'No Description',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
