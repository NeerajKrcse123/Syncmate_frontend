// // lib/screens/contact_list_screen.dart
// import 'package:flutter/material.dart';
// import 'contact_detail_screen.dart';

// class ContactListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contacts'),
//       ),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           final contact = contacts[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage(contact.image),
//             ),
//             title: Text(contact.name),
//             subtitle: Text(contact.phoneNumber),
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => ContactDetailScreen(
//                     name: contact.name,
//                     phoneNumber: contact.phoneNumber,
//                     image: contact.image,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class Contact {
//   final String name;
//   final String phoneNumber;
//   final String image;

//   Contact({
//     required this.name,
//     required this.phoneNumber,
//     required this.image,
//   });
// }

// // Replace 'contacts' with your actual list of contacts
// List<Contact> contacts = [
//   Contact(
//       name: 'John Doe',
//       phoneNumber: '123-456-7890',
//       image: 'assets/contact1.png'),
//   Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//        Contact(
//       name: 'Jane Smith',
//       phoneNumber: '987-654-3210',
//       image: 'assets/contact2.png'),
//   // Add more contacts as needed
// ];



import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;
  final String image;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.image,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
    );
  }
}

Future<List<Contact>> fetchContacts() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/contacts/'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Contact.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load contacts');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List App',
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts().then((fetchedContacts) {
      setState(() {
        contacts = fetchedContacts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contact.image),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            onTap: () {
              // Handle tapping on a contact
              // You can navigate to a detail screen or perform other actions here
            },
          );
        },
      ),
    );
  }
}







