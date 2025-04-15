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

    void onShowConfirmationModal() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Are you sure want to delete this item?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Delete"),
              ),
            ],
          );
        },
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "this is a description text example. Please learn more about it. Flutter is very cool. You should learn it in 2025 if you want to be a cool mobile developer.",
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onShowConfirmationModal,
              child: Text("Open Confirmation Modal"),
            ),
            FittedBox(
              //make text or it's child fit in screen
              child: Text(
                "Hello Flutter",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  letterSpacing: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
