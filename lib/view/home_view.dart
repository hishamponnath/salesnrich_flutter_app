import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:salesnrich_app_flutter/service/documents_service.dart';

class homescreen extends StatefulWidget {
  final UserModel? user;
  const homescreen({super.key, this.user});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  DocumentsService _documentsService = DocumentsService();
  @override
  void initState() {
    _documentsService.getalldocumets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 167, 193),
        title: const Text("Hisham"),
      ),
      body: Center(
        child: Text("${widget.user!.idToken}"),
      ),
    );
  }
}
