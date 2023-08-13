import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/screens/home_screen.dart';
import 'package:iti_project/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class Regist_Screen extends StatefulWidget {
  const Regist_Screen({super.key});

  @override
  State<Regist_Screen> createState() => _Regist_ScreenState();
}

class _Regist_ScreenState extends State<Regist_Screen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController nameControler = TextEditingController();
  TextEditingController statusControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  static File? _Picked_Image;
  bool visabilaty = true;
  XFile? returnedImage;
  final _db = FirebaseFirestore.instance;

  toJson() {
    return {
      "Name": nameControler.text,
      "E_Mail": emailControler.text,
      "Status": statusControler.text,
      "Password": passwordControler.text,
      "Image_Path": returnedImage!.path,
    };
  }

  createUser(BuildContext ctx) async {
    try {
      await _db.collection("Users_Info").add(
        {
          "Name": nameControler.text,
          "E_Mail": emailControler.text,
          "Status": statusControler.text,
          "Password": passwordControler.text,
          "Image_Path": returnedImage!.path,
        },
      ).whenComplete(() => () {
            ScaffoldMessenger.of(ctx).showSnackBar(
              const SnackBar(content: Text("Your Account Created Successfuly")),
            );
            print("Your Account Created Successfuly");
          });
    } catch (e) {
      print(e);
    }
  }

  Future PickImage(ImageSource imageSource) async {
    returnedImage = await ImagePicker().pickImage(
        source: imageSource, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    if (returnedImage == null) return;
    setState(() {
      _Picked_Image = File(returnedImage!.path);
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    confirmPasswordControler.dispose();
    statusControler.dispose();
    nameControler.dispose();
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
            image: NetworkImage(
                'https://tse1.mm.bing.net/th?id=OIP.VoYL5VM_Q-y_O3lq7Vc8ugHaNK&pid=Api&P=0&h=180'),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Center(
                    child: Text(
                      "Regist",
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
                      labelText: "Name",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    controller: nameControler,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "Please enter Correct Name";
                      }
                      return null;
                    },
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 15.0),
                  child: TextFormField(
                    controller: confirmPasswordControler,
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
                      labelText: "Confirm Password",
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
                      if (value != passwordControler.text) {
                        return "Password Not Same..";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 30.0),
                  child: TextFormField(
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
                      labelText: "Status",
                      prefixIcon: const Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                    ),
                    controller: statusControler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Status";
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
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: MaterialButton(
                      onPressed: () {
                        Dialogs.materialDialog(
                          context: ctx,
                          msg: "Pick Image From",
                          actions: [
                            IconsOutlineButton(
                              onPressed: () {
                                PickImage(ImageSource.gallery);
                                Navigator.of(ctx).pop();
                              },
                              text: 'Gallery',
                              iconData: Icons.browse_gallery,
                              textStyle: const TextStyle(color: Colors.grey),
                              iconColor: Colors.grey,
                            ),
                            IconsButton(
                              onPressed: () {
                                PickImage(ImageSource.camera);
                                Navigator.of(ctx).pop();
                              },
                              text: "Camira",
                              iconData: Icons.camera_alt,
                              color: Colors.red,
                              textStyle: const TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ],
                        );
                      },
                      child: const Text(
                        "Pick Image",
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
                  height: 10,
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
                          if (_Picked_Image == null) {
                            ScaffoldMessenger.of(ctx)
                                .showSnackBar(const SnackBar(
                              content: Text("Please Choose Image"),
                            ));
                          } else {
                            try {
                              await createUser(ctx);
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                    email: emailControler.text.trim(),
                                    password: passwordControler.text.trim(),
                                  )
                                  .then(
                                    (value) =>
                                        Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Home_Screen(),
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
                        }
                      },
                      child: const Text(
                        "Regist Now",
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
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Login_Screen(),
                      ),
                    );
                  },
                  child: Text(
                    "Already Have an Account ?",
                    style: GoogleFonts.ebGaramond(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
