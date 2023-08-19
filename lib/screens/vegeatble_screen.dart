import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vegetables_Screen extends StatelessWidget {
  Vegetables_Screen({super.key});
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Home")
              .doc("Vegetables")
              .snapshots(),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Sorry An Error Ocured"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (snapshot.data != null) {
              return GridView(
                padding: const EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 5 / 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                ),
                children: [
                  item(1, snapshot, context),
                  item(2, snapshot, context),
                  item(3, snapshot, context),
                  item(4, snapshot, context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

Widget item(
  int index,
  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      Dialogs.materialDialog(
          context: context,
          msg: snapshot.data?["meal$index"][0],
          useSafeArea: true,
          color: Colors.grey,
          titleStyle: GoogleFonts.robotoMono(),
          msgStyle: TextStyle(
            color: Colors.green[100],
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          title: snapshot.data?["meal$index"][2]);
    },
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(snapshot.data?["meal$index"][3]),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.6),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                snapshot.data?["meal$index"][0],
                style: GoogleFonts.robotoCondensed(
                  fontSize:
                      (snapshot.data!["meal$index"][0].toString().length > 7)
                          ? 30
                          : 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: snapshot.data!["meal$index"][1],
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 35,
                        color: Colors.deepPurple[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " CaL",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 20,
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
