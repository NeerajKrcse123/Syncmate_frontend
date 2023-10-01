// lib/screens/contact_detail_screen.dart
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html';

class ContactDetailScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String image;

  ContactDetailScreen({
    required this.name,
    required this.phoneNumber,
    required this.image,
  });

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  String? _imageDataUrl;

  Future<void> _getImage() async {
    final input = FileUploadInputElement()..accept = 'image/*';

    // Trigger a click event on the hidden input element
    input.click();

    // Listen for changes to the selected file
    input.onChange.listen((e) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final file = files[0];
        final reader = FileReader();

        // Read the selected file as data URL
        reader.readAsDataUrl(file);

        reader.onLoadEnd.listen((e) {
          // Set the selected image data URL
          setState(() {
            _imageDataUrl = reader.result.toString();
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (_imageDataUrl != null) {
                  // Implement logic to view the image in full screen.
                }
              },
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: _imageDataUrl != null
                    ? Image.memory(Uint8List.fromList(base64Decode(_imageDataUrl!.split(',').last))).image
                    : AssetImage(widget.image),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.name,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.phoneNumber,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Change Image'),
            ),
          ],
        ),
      ),
    );
  }
}


