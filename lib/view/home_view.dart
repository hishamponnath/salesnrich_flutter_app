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
  late ValueNotifier<ThemeMode> _themeModeNotifier;

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
        backgroundColor: Colors.blue[800],
        title: const Text("Hisham"),
        actions: [
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
