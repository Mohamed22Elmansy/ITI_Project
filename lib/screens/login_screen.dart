import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/screens/regist_screen.dart';

import 'home_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool visabilaty = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://wallpaperaccess.com/full/436201.jpg'),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.anton(
                        color: Colors.black,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      labelText: "E_Mail",
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Colors.black,
                      ),
                    ),
                    controller: emailControler,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@gmail")) {
                        return "Invalid Email address";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 15.0),
                  child: TextFormField(
                    controller: passwordControler,
                    obscureText: visabilaty,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(
                        Icons.password_sharp,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: visabilaty
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            visabilaty = !visabilaty;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return "Must be More than 8 letter";
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Builder(builder: (ctx) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: emailControler.text.trim(),
                                  password: passwordControler.text.trim(),
                                )
                                .then(
                                  (value) =>
                                      Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const Home_Screen(),
                                    ),
                                  ),
                                );

                            print("Login Successfully");
                          } catch (e) {
                            ScaffoldMessenger.of(ctx).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ? ",
                        style: GoogleFonts.ebGaramond(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Regist_Screen(),
                          ),
                        );
                      },
                      child: Text(
                        "Regist Now",
                        style: GoogleFonts.ebGaramond(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
