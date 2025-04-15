import 'package:flutter/material.dart';

// Models
class ProfileState {
  final TextEditingController nameController;
  final bool isChecked;
  final bool isCheckedListTile;
  final bool isSwitched;
  final double sliderValue;
  final String? dropdownValue;

  ProfileState({
    required this.nameController,
    this.isChecked = false,
    this.isCheckedListTile = false,
    this.isSwitched = false,
    this.sliderValue = 0.0,
    this.dropdownValue,
  });

  ProfileState copyWith({
    bool? isChecked,
    bool? isCheckedListTile,
    bool? isSwitched,
    double? sliderValue,
    String? dropdownValue,
  }) {
    return ProfileState(
      nameController: nameController,
      isChecked: isChecked ?? this.isChecked,
      isCheckedListTile: isCheckedListTile ?? this.isCheckedListTile,
      isSwitched: isSwitched ?? this.isSwitched,
      sliderValue: sliderValue ?? this.sliderValue,
      dropdownValue: dropdownValue ?? this.dropdownValue,
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Remove 'final' keyword to make _state mutable
  ProfileState _state = ProfileState(nameController: TextEditingController());

  // Remove initState since we're initializing _state directly

  @override
  void dispose() {
    _state.nameController.dispose();
    super.dispose();
  }

  static const List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
    DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
    DropdownMenuItem(value: "Option 3", child: Text("Option 3")),
  ];

  void _onChangedSwitch(bool value) => setState(() {
    _state = _state.copyWith(isSwitched: value);
  });

  void _onChangedSlider(double value) => setState(() {
    _state = _state.copyWith(sliderValue: value);
  });

  void _onButtonPressed(String buttonType) {
    debugPrint("$buttonType button pressed");
  }

  void _onCheckboxChanged(bool? value) => setState(() {
    _state = _state.copyWith(isChecked: value ?? false);
  });

  void _onCheckboxListTileChanged(bool? value) => setState(() {
    _state = _state.copyWith(isCheckedListTile: value ?? false);
  });

  void _onDropdownChanged(String? value) => setState(() {
    _state = _state.copyWith(dropdownValue: value);
  });

  Widget _buildTextField() => TextField(
    controller: _state.nameController,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onChanged: (_) => setState(() {}),
  );

  Widget _buildCheckbox() => Checkbox(
    shape: const CircleBorder(),
    value: _state.isChecked,
    onChanged: _onCheckboxChanged,
  );

  Widget _buildCheckboxListTile() => CheckboxListTile(
    contentPadding: EdgeInsets.zero,
    title: const Text("Checkbox List Tile"),
    value: _state.isCheckedListTile,
    onChanged: _onCheckboxListTileChanged,
  );

  Widget _buildSwitch() =>
      Switch.adaptive(value: _state.isSwitched, onChanged: _onChangedSwitch);

  Widget _buildSwitchListTile() => SwitchListTile(
    title: const Text("Switch List Tile"),
    value: _state.isSwitched,
    onChanged: _onChangedSwitch,
  );

  Widget _buildSlider() => Slider(
    max: 100,
    divisions: 10,
    activeColor: Colors.lightGreenAccent,
    value: _state.sliderValue,
    onChanged: _onChangedSlider,
  );

  Widget _buildInkWellContainer() => InkWell(
    splashColor: Colors.red,
    onTap: () => debugPrint("box pressed"),
    borderRadius: BorderRadius.circular(10),
    child: Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  Widget _buildButtonsWrap() => Wrap(
    children: [
      ElevatedButton(
        onPressed: () => _onButtonPressed("Elevated"),
        child: const Text("Elevated Button"),
      ),
      FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.lightGreenAccent,
          foregroundColor: Colors.black,
        ),
        onPressed: () => _onButtonPressed("Filled"),
        child: const Text("Filled Button"),
      ),
      OutlinedButton(
        onPressed: () => _onButtonPressed("Outline"),
        child: const Text("Outline Button"),
      ),
      TextButton(
        onPressed: () => _onButtonPressed("Text"),
        child: const Text("Text Button"),
      ),
      CloseButton(onPressed: () => _onButtonPressed("Close")),
      BackButton(onPressed: () => _onButtonPressed("Back")),
    ],
  );

  Widget _buildDropdown() => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: DropdownButton<String>(
      value: _state.dropdownValue,
      items: _dropdownItems,
      onChanged: _onDropdownChanged,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down_circle, color: Colors.deepPurple),
      underline: Container(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      borderRadius: BorderRadius.circular(8),
      hint: const Text('Select an option'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("User enter: ${_state.nameController.text}")],
            ),
            Row(children: [_buildCheckbox()]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("is Checked: ${_state.isChecked}")],
            ),
            _buildCheckboxListTile(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("is Checked List Tile: ${_state.isCheckedListTile}"),
              ],
            ),
            Row(children: [_buildSwitch()]),
            _buildSwitchListTile(),
            _buildSlider(),
            _buildInkWellContainer(),
            _buildButtonsWrap(),
            _buildDropdown(),
          ],
        ),
      ),
    );
  }
}
