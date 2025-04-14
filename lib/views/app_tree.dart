import 'package:flutter/material.dart';
import 'package:flutter_start/data/notifiers.dart';
import 'package:flutter_start/views/pages/home_page.dart';
import 'package:flutter_start/views/pages/profile_page.dart';
import 'package:flutter_start/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class AppTree extends StatelessWidget {
  const AppTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: isDarkThemeNotifier,
              builder: (context, isDark, child) {
                return Icon(isDark ? Icons.light_mode : Icons.dark_mode);
              },
            ),
            onPressed: () {
              isDarkThemeNotifier.value = !isDarkThemeNotifier.value;
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages[selectedPage];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
