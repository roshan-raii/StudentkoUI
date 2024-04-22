import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/presentation/screens/ProfilePage/Profile.dart';
import 'package:student_application/presentation/screens/RoutinePage/Calander.dart';
import 'package:student_application/presentation/screens/RoutinePage/time_module.dart';

// import 'package:table_calendar/table_calendar.dart';

class RoutinePage extends StatefulWidget {
  RoutinePage({Key? key}) : super(key: key);

  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 246),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(context),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4.78 / 9.6,
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
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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

            // _calendarSection(),
            Calendar(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Time",
                    style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 126, 126, 126),
                    )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  Text(
                    "Module",
                    style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 126, 126, 126),
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 90,
            ),
            //time and module
            TimeModule(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            TimeModule()
          ],
        ),
      ],
    );
  }
}
