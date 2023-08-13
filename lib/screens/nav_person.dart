import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nav_Person extends StatelessWidget {
  Nav_Person({super.key});
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: StreamBuilder(
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Sorry An Error Ocured"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Profile",
                            style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontSize: 40,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: CircleAvatar(
                              radius: 100,
                              backgroundImage: Image.file(
                                File(
                                  snapshot.data!.docs[index]["Image_Path"]
                                      .toString(),
                                ),
                                fit: BoxFit.fill,
                              ).image,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            snapshot.data?.docs[index]["Name"],
                            style: GoogleFonts.robotoSlab(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          title: Text(snapshot.data?.docs[index]["E_Mail"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "Status",
                            style: GoogleFonts.merriweather(
                              color: Colors.green,
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 2,
                            endIndent: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            snapshot.data?.docs[index]["Status"],
                            style: GoogleFonts.merriweather(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  });
            }
            return Container();
          },
          stream: FirebaseFirestore.instance
              .collection("Users_Info")
              .where(
                "E_Mail",
                isEqualTo: currentUser?.email,
              )
              .snapshots(),
        ),
      ),
    );
  }
}
