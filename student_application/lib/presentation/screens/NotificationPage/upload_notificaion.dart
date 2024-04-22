import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadNotification extends StatelessWidget {
  final String imagepath, teacherName, time, notificationContent;

  UploadNotification(
      {super.key,
      required this.imagepath,
      required this.teacherName,
      required this.time,
      required this.notificationContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 224, 230, 243),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        imagepath,
                      ),
                      radius: 13,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      teacherName,
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width / 2.7,
                        width: 1,
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: Text(
                        time,
                        style: GoogleFonts.redHatDisplay(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0),
                  child: Text(
                    notificationContent,
                    style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(fontSize: 13)),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 70,
        ),
      ],
    );
  }
}
