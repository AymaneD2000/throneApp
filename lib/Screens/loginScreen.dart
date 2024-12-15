import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'signupPage.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F9),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/music_wave.png',
              color: Colors.teal,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Throne',
                      style: GoogleFonts.montserrat(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF37474F),
                        shadows: [
                          const Shadow(
                            blurRadius: 10,
                            color: Colors.tealAccent,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'VIVEZ LA MUSIQUE AUTREMENTS',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: const Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Email and Password fields (unchanged)
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal.withOpacity(0.1),
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Color(0xFF37474F)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.email, color: Color(0xFF37474F)),
                      ),
                      style: const TextStyle(color: Color(0xFF37474F)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal.withOpacity(0.1),
                        hintText: 'Mot de passe',
                        hintStyle: const TextStyle(color: Color(0xFF37474F)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.lock, color: Color(0xFF37474F)),
                      ),
                      style: const TextStyle(color: Color(0xFF37474F)),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider(color: Color(0xFFB0BEC5))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Ou connectez-vous avec',
                            style: TextStyle(color: Color(0xFF616161)),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xFFB0BEC5))),
                      ],
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/google.png',
                        width: 50,
                      ),
                      iconSize: 50,
                      onPressed: () async {
                        await _handleGoogleSignIn(context);
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Pas de compte?",
                          style: TextStyle(color: Color(0xFF616161)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (builder) => SignUpPage()));
                          },
                          child: const Text(
                            "S'inscrire",
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return;
      }

      final String idToken = (await googleUser.authentication).idToken!;

      // Send the token to your backend
      final Uri url =
          Uri.parse('https://dev.suguonline.com/api/v1/auth/google/redirect');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'idToken': idToken}),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        final data = jsonDecode(response.body);
        // You can store the token or navigate to another screen
        print('Login Successful: ${data['message']}');
      } else {
        // Handle errors
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
}
