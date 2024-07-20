import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:salesnrich_app_flutter/view/documents_view.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _indicatorPositionNotifier = ValueNotifier<double>(0.0);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Hisham"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              final isDarkMode =
                  Theme.of(context).brightness == Brightness.dark;
              widget.onThemeModeChanged(
                  isDarkMode ? ThemeMode.light : ThemeMode.dark);
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
        children:  [
            Container(
            child: const Column(
              children: [
                SizedBox(height: 300),
                Expanded(
                  child: Documentsclass(),
                ),
              ],
            ),
          ),
          Container(
            child: const Column(
              children: [
                SizedBox(height: 300),
                Expanded(
                  child: Documentsclass(),
                ),
              ],
            ),
          ),
          Container(
            child: const Column(
              children: [
                SizedBox(height: 300),
                Expanded(
                  child: Documentsclass(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
