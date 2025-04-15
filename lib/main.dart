import 'package:flutter/material.dart';
import 'package:flutter_start/data/notifiers.dart';
import 'package:flutter_start/views/app_tree.dart';
import 'package:flutter_start/views/pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkThemeNotifier,
      builder: (context, isDarkTheme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
          ),
          home: AppTree(),
          routes: {'/settings': (context) => const SettingPage()},
        );
      },
    );
  }
}
