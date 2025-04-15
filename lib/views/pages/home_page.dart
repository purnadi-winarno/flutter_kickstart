import 'package:flutter/material.dart';
import 'package:flutter_start/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onShowSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text("Here's snackbar"),
            ],
          ),
        ),
      );
    }

    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Column(
          children: [
            HeroWidget(),
            ElevatedButton(
              onPressed: onShowSnackBar,
              child: Text("Show Snackbar"),
            ),
          ],
        ),
      ),
    );
  }
}
