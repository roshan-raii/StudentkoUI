import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 120, 150, 255),
                  Color.fromARGB(0, 255, 90, 120),
                ],
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 20,
            child: Image.asset(
              "assets/images/banner.png",
              scale: 4,
            ),
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 5 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 333,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 60,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 200,
            left: MediaQuery.of(context).size.width / 2 - 47,
            child: Row(
              children: [
                Text(
                  "Roshan Rai",
                  style: GoogleFonts.redHatDisplay(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 150,
            left: MediaQuery.of(context).size.width / 2 - 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Year:",
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text(
                  "3rd Year",
                  style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Group:",
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text(
                  "L3C4",
                  style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Faculty:",
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text(
                  "Bsc(hons) Computing",
                  style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "College mail:",
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text(
                  "np05cp4s220045@iic.edu.np",
                  style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "London met ID:",
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text(
                  "22016076",
                  style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "London met email:",
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text(
                  "ROR321@my.londonmet.ac.uk",
                  style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
