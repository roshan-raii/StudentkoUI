import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/presentation/screens/Chatbox/chatBox.dart';
import 'package:student_application/presentation/screens/ProfilePage/Profile.dart';

class Java extends StatelessWidget {
  Java({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _header(context),
          _moduleInfo(context),
          ElevatedButton(
            onPressed: () {
              _showRatingDialog(context);
            },
            child: Text(
              'Rate Module Leader',
              style: GoogleFonts.redHatDisplay(
                  textStyle: TextStyle(fontSize: 14, color: Colors.black)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5.5,
          ),
          _chat(context),
          SizedBox(
            height: MediaQuery.of(context).size.height / 85,
          ),
          _attendanceButton(context),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 35 / 9.6,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 6.5),
                Image.asset(
                  "assets/images/banner.png",
                  scale: 4,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 12),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfilePage())),
                  child: Container(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.png"),
                      radius: 100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _moduleInfo(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 12 / 9.6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Module Information",
                      style: GoogleFonts.redHatDisplay(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Code: CC4500NT",
                            style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            "Java",
                            style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Aryaman Rai",
                            style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 62,
                        backgroundColor: Color.fromARGB(255, 224, 221, 221),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/teacher2.png"),
                          radius: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Text(
                  "The Java module typically refers to a distinct unit of code organization within a larger software system or application, focusing on Java programming language-specific functionalities and components.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.redHatDisplay(
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chat(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => ChatScreen())),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Click on icon to have a chat with module leader",
              style: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/chat.png",
                  scale: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        double _rating = 0;
        return AlertDialog(
          title: Text(
            'Rate Module Leader',
            style: GoogleFonts.redHatDisplay(
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              SizedBox(
                height: 6,
              ),
              ElevatedButton(
                onPressed: () {
                  // You can use _rating here for further processing
                  print('Rated: $_rating');
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.redHatDisplay(
                      textStyle: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _attendanceButton(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedButton(
          text: "Missed",
          color: Colors.red,
          buttonTextStyle: GoogleFonts.redHatDisplay(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          pressEvent: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Missed",
              desc:
                  "Every setback is a setup for a comeback. Stay resilient and keep moving forward.",
              descTextStyle: GoogleFonts.redHatDisplay(textStyle: TextStyle()),
              btnOkOnPress: () {},
            ).show();
          }),
    );
  }
}
