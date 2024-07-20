// import 'package:flutter/material.dart';
// import 'package:salesnrich_app_flutter/model/usermodel.dart';
// import 'package:salesnrich_app_flutter/view/documents_view.dart';
// import 'package:salesnrich_app_flutter/view/drawer_view.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final ValueNotifier<ThemeMode> _themeModeNotifier =
//       ValueNotifier(ThemeMode.light);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeMode>(
//       valueListenable: _themeModeNotifier,
//       builder: (context, themeMode, child) {
//         return MaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData.light(),
//           darkTheme: ThemeData.dark(),
//           themeMode: themeMode,
//           home: HomeScreen(themeModeNotifier: _themeModeNotifier),
//         );
//       },
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   final ValueNotifier<ThemeMode> themeModeNotifier;
//   final UserModel? user;

//   const HomeScreen({super.key, required this.themeModeNotifier, this.user});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late ValueNotifier<double> _indicatorPositionNotifier;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _indicatorPositionNotifier = ValueNotifier<double>(0.0);

//     _tabController.addListener(() {
//       if (_tabController.indexIsChanging) {
//         _indicatorPositionNotifier.value = _tabController.index.toDouble();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _indicatorPositionNotifier.dispose();
//     super.dispose();
//   }

//   void _toggleTheme() {
//     if (widget.themeModeNotifier.value == ThemeMode.light) {
//       widget.themeModeNotifier.value = ThemeMode.dark;
//     } else {
//       widget.themeModeNotifier.value = ThemeMode.light;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[800],
//         title: const Text("Hisham"),
//         actions: [
//           IconButton(
//             icon: Icon(
//               widget.themeModeNotifier.value == ThemeMode.light
//                   ? Icons.dark_mode
//                   : Icons.light_mode,
//             ),
//             onPressed: _toggleTheme,
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(kToolbarHeight),
//           child: TabBar(
//             controller: _tabController,
//             tabs: const [
//               Tab(text: "Activity Summary"),
//               Tab(text: "Performance"),
//               Tab(text: "Payment Summary"),
//             ],
//             indicator: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: const Color.fromARGB(255, 66, 133, 188),
//             ),
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white,
//             indicatorColor: Colors.transparent,
//           ),
//         ),
//       ),
//       drawer: const Drawer(child: Drawerclass()),
//       body: TabBarView(
//         controller: _tabController,
//         children: const [
//           Documentsclass(),
//           Documentsclass(),
//           Documentsclass(),
//         ],
//       ),
//     );
//   }
// }
