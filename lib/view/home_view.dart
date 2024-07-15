import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/documentsmodel.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:salesnrich_app_flutter/service/documents_service.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final DocumentsService _documentsService = DocumentsService();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 167, 193),
        title: const Text("Hisham"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Activity Summary"),
            Tab(text: "Performance"),
            Tab(text: "Payment Summary"),
          ],
        ),
      ),
      drawer: const Drawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          FutureBuilder(
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
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const Center(child: Text("Performance")),
          const Center(child: Text("Payment Summary")),
        ],
      ),
    );
  }
}
