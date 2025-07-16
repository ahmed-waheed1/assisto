import 'package:assisto/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? _darkTheme : _lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static final ThemeData _lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData _darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static ThemeNotifier of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!.themeNotifier;
  }
}

class _MyAppState extends State<MyApp> {
  final ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  void initState() {
    super.initState();
    themeNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeNotifier.isDarkMode
            ? Brightness.light
            : Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'My Assistant',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      home: const WelcomeScreen(),
    );
  }

  @override
  void dispose() {
    themeNotifier.dispose();
    super.dispose();
  }
}
