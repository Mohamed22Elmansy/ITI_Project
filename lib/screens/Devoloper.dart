import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Devolopers extends StatelessWidget {
  const Devolopers({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Devolopers",
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[400],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "This App was devoloped By : ",
                  style: GoogleFonts.raleway(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Eng. Mohamed Al-Rifai Elmansy",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  onTap: () async {
                    launchUrl(
                        Uri.parse(
                            "https://www.facebook.com/mohamed.elmansy.756412?mibextid=2JQ9oc"),
                        mode: LaunchMode.externalApplication);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Eng. Mahmoud Sherif Hassan",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  onTap: () async {
                    launchUrl(
                        Uri.parse(
                            "https://www.facebook.com/profile.php?id=100011246808641"),
                        mode: LaunchMode.externalApplication);
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: const Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://tse3.mm.bing.net/th?id=OIP.TJO-CjFrXCs8_G_m2KEk5wHaE8&pid=Api&P=0&h=180"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
