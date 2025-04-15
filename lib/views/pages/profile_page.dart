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
  String? dropdownValue;

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

  void onButtonPressed(String buttonType) {
    print("$buttonType button pressed");
  }

  // Change the type declaration from List<Widget> to List<DropdownMenuItem<String>>
  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
    DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
    DropdownMenuItem(value: "Option 3", child: Text("Option 3")),
  ];

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
            InkWell(
              splashColor: Colors.red,
              onTap: () {
                print("box pressed");
              },
              borderRadius: BorderRadius.circular(
                10,
              ), //don't forget this too -> as BoxDecoration size
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed("Elevated"),
                  child: Text("Elevated Button"),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => onButtonPressed("Filled"),
                  child: Text("Filled Button"),
                ),
                OutlinedButton(
                  onPressed: () => onButtonPressed("Outline"),
                  child: Text("Outline Button"),
                ),
                TextButton(
                  onPressed: () => onButtonPressed("Text"),
                  child: Text("Text Button"),
                ),
                CloseButton(onPressed: () => onButtonPressed("Close")),
                BackButton(onPressed: () => onButtonPressed("Back")),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                items: dropdownItems,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.deepPurple,
                ),
                underline: Container(), // removes the default underline
                padding: const EdgeInsets.symmetric(horizontal: 12),
                borderRadius: BorderRadius.circular(8),
                hint: const Text('Select an option'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
