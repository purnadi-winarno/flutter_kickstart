import 'package:flutter/material.dart';
import 'package:flutter_start/widgets/navbar_widget.dart';

class AppTree extends StatelessWidget {
  const AppTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My App")),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}
