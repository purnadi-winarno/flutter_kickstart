import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  bool isChecked = false;
  bool isCheckedListTile = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("User enter: ${nameController.text}")],
          ),
          Row(
            children: [
              Checkbox(
                shape: CircleBorder(),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("is Checked: $isChecked")],
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0.0),
            title: Text("Checkbox List Tile"),
            value: isCheckedListTile,
            onChanged: (value) {
              setState(() {
                isCheckedListTile = value!;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("is Checked List Tile: $isCheckedListTile")],
          ),
        ],
      ),
    );
  }
}
