import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, currentMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          //  color: Colors.white,
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: SplashScreen(
            onThemeModeChanged: (mode) => _themeMode.value = mode,
          ),
        );
      },
    );
  }
}
