// // models/contact.dart

// class Contact {
//   final String name;
//   final String phoneNumber;
//   final String image;
//   String ringtone;

//   Contact({
//     required this.name,
//     required this.phoneNumber,
//     required this.image,
//     required this.ringtone,
//   });
// }

import 'dart:io';

class Contact {
  final String name;
  final String phoneNumber;
  String image; // Change the type to String
  File? imageFile; // Updated property to store selected image file
  String ringtone;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.image,
    required this.ringtone,
  });
}







