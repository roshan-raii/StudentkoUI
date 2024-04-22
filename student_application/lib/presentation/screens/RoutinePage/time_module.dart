import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeModule extends StatelessWidget {
  TimeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '''9:00 
- 10:30''',
                    style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 110, // Adjust the height as needed
                  width: 1, // Thickness of the vertical line
                  color: Color.fromARGB(
                      255, 214, 212, 212), // Color of the vertical line
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 84, 188, 87),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Software Engineering",
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Royal Albert Hall",
                            style: GoogleFonts.redHatDisplay(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                            radius: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "John Doe",
                            style: GoogleFonts.redHatDisplay(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
