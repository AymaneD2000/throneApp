import 'dart:convert'; // For JSON encoding/decoding
import 'package:http/http.dart' as http;
import 'package:throneapp/models/User.dart';

class Api {
  static const String _baseEndpoint = "https://dev.suguonline.com/api/v1/";
  static String token = "";
  
  Future<void> userRegistration(User user) async {
    // Construct the URL for registration
    final Uri url = Uri.parse('${_baseEndpoint}auth/register');
    
    try {
      // Send the POST request with the user's data as JSON
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set content type to JSON
          'Accept': 'application/json',
        },
        body: jsonEncode(user.toMap()), // Convert user object to JSON
      );
      
      // Log the status code and response body
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
    } catch (e) {
      // Log any exceptions that occur
      print('Error during registration: $e');
      rethrow; // Re-throw the exception for further handling
    }
  }

  Future<void> loginWithEmail(String email, String password)async{
    final Uri url = Uri.parse('${_baseEndpoint}auth/login');
    try{
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set content type to JSON
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "email":email,
          "password":password
        })
        );
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        token = responseData['data']['token'];
        // Log the status code and response body
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }catch(e){
      // Log any exceptions that occur
      print('Error during registration: $e');
      rethrow; // Re-throw the exception for further handling
    }
  }

  Future<void> loggout()async{
    final Uri url = Uri.parse('${_baseEndpoint}logout');
    try{
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set content type to JSON
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
        );
        print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }catch(e){
      // Log any exceptions that occur
      print('Error during loggout: $e');
      rethrow; // Re-throw the exception for further handling
    }
  }

  Future<User> getLoggedInformation() async {
    final Uri url = Uri.parse('${_baseEndpoint}user');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', // Include Bearer token here
        },
      );

      if (response.statusCode == 200) {
        // Parse and return the User object
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return User.fromSanpshot(responseData);
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Failed to fetch user information: ${errorData['message']}');
      }
    } catch (e) {
      print('Error during fetching user information: $e');
      rethrow;
    }
  }
}
