import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String contactImage = '/contact_image';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}




