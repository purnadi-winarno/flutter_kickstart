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
        body:
            selectedIndex == 0
                ? Center(child: Text("Home page"))
                : Center(child: Text("Profile page")),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profiles"),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex,
          backgroundColor: Colors.tealAccent.shade700,
        ),
      ),
    );
  }
}
