// import 'package:flutter/material.dart';
// import 'routes.dart';


// void main() {
//   runApp(SyncMateApp());
// }

// class SyncMateApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SyncMate',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: AppRoutes.login,
//       onGenerateRoute: AppRoutes.generateRoute,
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:sync_mate/screens/contact_list_screen.dart';
import 'package:sync_mate/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SyncMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      // home: ContactListScreen(),
    );
  }
}

