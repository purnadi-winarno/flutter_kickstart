import 'package:flutter/material.dart';
import 'package:flutter_start/views/widgets/hero_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Center(
        child: Column(
          children: [
            HeroWidget(),
            Text("this is a hero image. see the navigation transition"),
          ],
        ),
      ),
    );
  }
}
