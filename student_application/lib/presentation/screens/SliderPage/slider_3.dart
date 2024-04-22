import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySlider3 extends StatelessWidget {
  MySlider3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width, // Occupy full width
                height: MediaQuery.of(context).size.height *
                    2.5 /
                    5, // 3/4 of screen height
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 139, 232, 10),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                clipBehavior: Clip
                    .antiAliasWithSaveLayer, //this gives radius to the image
                child: Image.asset(
                  "assets/images/profile.png",
                  scale: 5,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width / 2,
                alignment: Alignment(0, 1),
                child: Image.asset("assets/images/banner.png"),
              )
              // Positioned(
              //     height: MediaQuery.of(context).size.height * 0.5,
              //     width: MediaQuery.of(context).size.width * 0.2,
              //     child: Image.asset(
              //       "assets/images/banner.png",
              //       scale: 7,
              //     ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text("""Quality Course
Across The Globe""",
              style: GoogleFonts.redHatDisplay(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30.0,
              left: 20,
              right: 20,
            ),
            child: Text(
              "London  Metropolitan  University,  commonly  known  as London Met, is  a public research  university  in  London, England.  The  University  of  North London  and London Guildhall    University   merged   in   2002  to  create  the university.  The  University's  roots  go back to 1848.",
              textAlign: TextAlign.justify,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     MyButton(
          //       text: "Back",
          //       verticalPadding: 5,
          //       horizontalPadding: 40,
          //       textSize: 18,
          //       color: Color.fromARGB(255, 206, 220, 235),
          //       textColor: Colors.black,
          //       onTap: () {
          //         Navigator.push(
          //             context, MaterialPageRoute(builder: (_) => MySlider2()));
          //       },
          //     ),
          // MyButton(
          //   text: "Next",
          //   verticalPadding: 5,
          //   horizontalPadding: 40,
          //   textSize: 18,
          //   color: Color.fromARGB(255, 60, 210, 150),
          //   textColor: Colors.white,
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => MySlider4()));
          //   },
          // )
          //   ],
          // )
        ],
      ),
    );
  }
}
