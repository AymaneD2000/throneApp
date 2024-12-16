import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throneapp/models/User.dart';

import '../service/api.dart';

class SignUpPage extends StatelessWidget {
  final Api api = Api();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                      'CRÉEZ VOTRE COMPTE',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: const Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal.withOpacity(0.1),
                        hintText: 'Nom',
                        hintStyle: const TextStyle(color: Color(0xFF37474F)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.person, color: Color(0xFF37474F)),
                      ),
                      style: const TextStyle(color: Color(0xFF37474F)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
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
                      controller: passwordController,
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
                    const SizedBox(height: 20),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal.withOpacity(0.1),
                        hintText: 'Confirmez le mot de passe',
                        hintStyle: const TextStyle(color: Color(0xFF37474F)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF37474F)),
                      ),
                      style: const TextStyle(color: Color(0xFF37474F)),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (passwordController.text == confirmPasswordController.text) {
                          await api.userRegistration(
                            User(email: emailController.text, nom: nameController.text, password: passwordController.text, confirmation: confirmPasswordController.text)
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Les mots de passe ne correspondent pas.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'S\'inscrire',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    EasyRichText(
                      "Vous avez déjà un compte? Connectez-vous",
                        patternList: const [
                          EasyRichTextPattern(
                            targetString: 'Vous avez déjà un compte?',
                            style: TextStyle(color: Color(0xFF616161)),
                            ),
                          EasyRichTextPattern(
                            targetString: 'Connectez-vous',
                            style: TextStyle(color: Colors.teal, overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Vous avez déjà un compte?',
                    //       style: TextStyle(color: Color(0xFF616161)),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: const Text(
                    //         softWrap: true,
                    //         overflow: TextOverflow.ellipsis,
                    //         'Connectez-vous',
                    //         style: TextStyle(color: Colors.teal, overflow: TextOverflow.ellipsis),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
