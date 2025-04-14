import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          backgroundColor: Colors.tealAccent.shade700,
        ),
        body: const Center(child: Text("Hello World")),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          ],
          onTap: (value) => setState(() => selectedIndex = value),
          backgroundColor: Colors.tealAccent.shade700,
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
