import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/documentsmodel.dart';
import 'package:salesnrich_app_flutter/model/menuitemsmodel.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:salesnrich_app_flutter/service/documents_service.dart';
import 'package:salesnrich_app_flutter/service/menuitems_service.dart';
import 'package:salesnrich_app_flutter/view/accountprofile_view.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final DocumentsService _documentsService = DocumentsService();
  final MenuitemsService _menuitemsService = MenuitemsService();
  late TabController _tabController;
  late ValueNotifier<double> _indicatorPositionNotifier;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _indicatorPositionNotifier = ValueNotifier<double>(0.0);

    // Listen to TabController changes to update the indicator position
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _indicatorPositionNotifier.value = _tabController.index.toDouble();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _indicatorPositionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List of icons for the menu items
    final List<IconData> menuIcons = [
      Icons.home,
      Icons.fingerprint,
      Icons.send_outlined,
      Icons.send_outlined,
      Icons.outbox,
      Icons.edit_calendar,
      Icons.lightbulb_sharp,
      Icons.map,
      Icons.notification_important,
      Icons.rotate_left,
      Icons.cleaning_services,
      Icons.settings,
      Icons.exit_to_app,
      Icons.web,
      Icons.gps_fixed,
      Icons.fingerprint,
      Icons.details_sharp,
      Icons.edit_calendar,
      Icons.send_outlined,
      Icons.account_box,
      Icons.extension,
      Icons.feedback,
      Icons.document_scanner,
      Icons.file_copy,
      Icons.switch_account_rounded,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 167, 193),
        title: const Text("Hisham"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AnimatedBuilder(
            animation: _indicatorPositionNotifier,
            builder: (context, child) {
              return TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Activity Summary"),
                  Tab(text: "Performance"),
                  Tab(text: "Payment Summary"),
                ],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: const Color.fromARGB(255, 66, 133, 188),
                ),
                labelColor: Colors.white, // Selected tab text color
                unselectedLabelColor: Colors.white, // Unselected tab text color
                indicatorColor: Colors
                    .transparent, // Set this to transparent to use custom indicator
              );
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: _menuitemsService.getAllMenuItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Menuitems> menuItemsList = snapshot.data!;
              return ListView.builder(
                itemCount: menuItemsList.length,
                itemBuilder: (context, index) {
                  Menuitems menuItem = menuItemsList[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4.0,
                    color: const Color.fromARGB(255, 135, 167, 193),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          menuIcons[index % menuIcons.length],
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        menuItem.label ?? 'No Label',
                        style: const TextStyle(color: Colors.white),
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
      ),
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AcoountProfile()),
                          );
                        },
                        leading: const CircleAvatar(child: Icon(Icons.book)),
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
          ),
          Container(
              color: Colors.amber,
              child: const Center(child: Text("Performance"))),
          const Center(child: Text("Payment Summary")),
        ],
      ),
    );
  }
}
