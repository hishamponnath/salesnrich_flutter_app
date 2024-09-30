import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:salesnrich_app_flutter/service/account_service.dart';
import 'package:salesnrich_app_flutter/view/attendance_view.dart';
import 'package:salesnrich_app_flutter/view/documents_view.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';
import 'package:salesnrich_app_flutter/model/accountmodel.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? user;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const HomeScreen({super.key, this.user, required this.onThemeModeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ValueNotifier<double> _indicatorPositionNotifier;
  late ValueNotifier<ThemeMode> _themeModeNotifier;
  late Future<AccountModel> _accountFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _indicatorPositionNotifier = ValueNotifier<double>(0.0);
    _themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _indicatorPositionNotifier.value = _tabController.index.toDouble();
      }
    });

    _accountFuture = _fetchAccount();
  }

  Future<AccountModel> _fetchAccount() async {
    final accountService =
        AccountService(); // Create an instance of AccountService
    final accountList = await accountService.getAccount(); // Fetch account list
    return accountList.isNotEmpty
        ? accountList[0]
        : AccountModel(); // Return the first account or a default
  }

  @override
  void dispose() {
    _tabController.dispose();
    _indicatorPositionNotifier.dispose();
    _themeModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
        backgroundColor: Colors.blue[800],
        title: FutureBuilder<AccountModel>(
          future: _accountFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            } else if (snapshot.hasError) {
              return const Text("Error");
            } else if (snapshot.hasData) {
              final employeeName = snapshot.data?.employeeName ?? "No Name";
              return Text(employeeName);
            } else {
              return const Text("No Data");
            }
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AttendanceView()),
                );
              },
              icon: const Icon(
                Icons.hdr_auto_outlined,
                color: Colors.white,
              )),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: _themeModeNotifier,
            builder: (context, themeMode, child) {
              return IconButton(
                icon: Icon(
                  themeMode == ThemeMode.dark
                      ? Icons.brightness_2
                      : Icons.sunny,
                  color:
                      themeMode == ThemeMode.dark ? Colors.white : Colors.amber,
                ),
                onPressed: () {
                  final isDarkMode = themeMode == ThemeMode.dark;
                  final newThemeMode =
                      isDarkMode ? ThemeMode.light : ThemeMode.dark;
                  _themeModeNotifier.value = newThemeMode;
                  widget.onThemeModeChanged(newThemeMode);
                },
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "Activity Summary"),
              Tab(text: "Performance"),
              Tab(text: "Payment Summary"),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 66, 133, 188),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
      drawer: const Drawer(child: Drawerclass()),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Column(
            children: [
              SizedBox(height: 300),
              Expanded(
                child: Documentsclass(),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 300),
              Expanded(
                child: Documentsclass(),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 300),
              Expanded(
                child: Documentsclass(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
