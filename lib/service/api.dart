import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:throneapp/models/Albums.dart';
import 'package:throneapp/models/Mixtape.dart';
import 'package:throneapp/models/Purchase.dart';
import 'package:throneapp/models/Song.dart';
import 'package:throneapp/models/User.dart';

class Api extends ChangeNotifier{
  List<Album> albums = [];
  List<Mixtape> mixtapes = [];
  List<Purchase> myPurchase = [];
  List<Song> mySongs = [];
  User? user;
  static const String _baseEndpoint = "https://dev.suguonline.com/api/v1/";
  static String token = "";
  
  Future<void> userRegistration(User user) async {
    // Construct the URL for registration
    final Uri url = Uri.parse('${_baseEndpoint}auth/register');
    
    try {
      // Send the POST request with the user's data as JSON
      await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set content type to JSON
          'Accept': 'application/json',
        },
        body: jsonEncode(user.toMap()), // Convert user object to JSON
      );
      
      notifyListeners();
      
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
      notifyListeners();
    }catch(e){
      // Log any exceptions that occur
      print('Error during registration: $e');
      rethrow; // Re-throw the exception for further handling
    }
  }

  Future<void> loggout()async{
    final Uri url = Uri.parse('${_baseEndpoint}logout');
    try{
      await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set content type to JSON
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
        );
      notifyListeners();
    }catch(e){
      // Log any exceptions that occur
      print('Error during loggout: $e');
      rethrow; // Re-throw the exception for further handling
    }
  }

  Future<void> getLoggedInformation() async {
    final Uri url = Uri.parse('${_baseEndpoint}user');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token' // Include Bearer token here
        },
      );

      if (response.statusCode == 200) {
        // Parse and return the User object
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        user = User.fromSanpshot(responseData);
        notifyListeners();
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Failed to fetch user information: ${errorData['message']}');
      }
    } catch (e) {
      print('Error during fetching user information: $e');
      rethrow;
    }
  }

  Future<void> fetchMusicsData() async {
    final Uri url = Uri.parse('${_baseEndpoint}products');// Replace with your actual API endpoint.

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      if (jsonData['status'] == true) {

        // Parse Albums
        albums = (jsonData['data']['albums'] as List)
            .map((album) => Album.fromSnapshot(album))
            .toList();
        // Parse Mixtapes
        mixtapes = (jsonData['data']['mixtapes'] as List)
            .map((mixtape) => Mixtape.fromSnapshot(mixtape))
            .toList();
        notifyListeners();
      } else {
        print('Failed to fetch data: ${jsonData['message']}');
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception occurred: $e');
  }
}


Future<void> fetchUserOrders(int userId) async {

  final Uri url = Uri.parse('${_baseEndpoint}user/orders?user_id=$userId');

  try {
    final response = await http.get(url
    ,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token' // Include Bearer token here
        },);


    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      if (jsonData['status'] == true) {
        print(jsonData['message']);

        // Parse Purchased
        myPurchase = (jsonData['data']['purchased'] as List)
        .map((purchased)=>Purchase.fromSnapshot(purchased))
        .toList();

        // Parse Songs
        mySongs = (jsonData['data']['songs'] as List)
        .map((song)=> Song.fromSnapshot(song))
        .toList();

        // Further processing can be done here if needed
      } else {
        print('Failed to fetch data: ${jsonData['message']}');
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception occurred: $e');
  }
}

}