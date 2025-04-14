import 'package:flutter/material.dart';
import 'package:flutter_start/views/pages/home_page.dart';
import 'package:flutter_start/views/pages/profile_page.dart';
import 'package:flutter_start/widgets/navbar_widget.dart';

List<Widget> pages = [const HomePage(), const ProfilePage()];

class AppTree extends StatelessWidget {
  const AppTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My App")),
      body: pages[0],
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
