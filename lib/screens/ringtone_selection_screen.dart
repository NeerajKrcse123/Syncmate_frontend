import 'package:flutter/material.dart';
// import 'package:your_app_name/routes/app_routes.dart';

class RingtoneSelectionScreen extends StatefulWidget {
  final String currentRingtone;
  final Function(String) onRingtoneSelected;

  RingtoneSelectionScreen({
    required this.currentRingtone,
    required this.onRingtoneSelected,
  });

  @override
  _RingtoneSelectionScreenState createState() => _RingtoneSelectionScreenState();
}

class _RingtoneSelectionScreenState extends State<RingtoneSelectionScreen> {
  String selectedRingtone = ''; // Provide an initial value

  @override
  void initState() {
    super.initState();
    selectedRingtone = widget.currentRingtone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Ringtone'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Ringtone 1'),
            onTap: () {
              setState(() {
                selectedRingtone = 'Ringtone 1';
              });
            },
            trailing: selectedRingtone == 'Ringtone 1' ? Icon(Icons.check) : null,
          ),
          // Add more ringtone options as needed
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Save the selected ringtone and notify the parent screen
              widget.onRingtoneSelected(selectedRingtone);
              Navigator.pop(context); // Close the ringtone selection screen
            },
            child: Text('Save Ringtone'),
          ),
        ],
      ),
    );
  }
}
