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
  bool isSwitched = false;
  double sliderValue = 0.0;

  void onChangedSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  void onChangedSlider(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
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
            Row(
              children: [
                Switch.adaptive(value: isSwitched, onChanged: onChangedSwitch),
              ],
            ),
            SwitchListTile(
              title: Text("Switch List Tile"),
              value: isSwitched,
              onChanged: onChangedSwitch,
            ),
            Slider(
              max: 100,
              divisions: 10,
              activeColor: Colors.lightGreenAccent,
              value: sliderValue,
              onChanged: onChangedSlider,
            ),
            GestureDetector(
              onTap: () {
                print("Image pressed");
              },
              child: Image.asset("assets/images/animal.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
