import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth_io.dart';

class GooglePeopleService {
  final String apiUrl =
      'https://people.googleapis.com/v1/people/me/connections?personFields=names,emailAddresses';

  Future<List<Map<String, dynamic>>> fetchContacts(String accessToken) async {
    final response = await http.get(
      Uri.parse('$apiUrl&access_token=$accessToken'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> contacts = data['connections'];
      return contacts;
    } else {
      print('Error response status code: ${response.statusCode}');
      print('Error response body: ${response.body}');
      throw Exception('Failed to load contacts');
    }
  }
}



