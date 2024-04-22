import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/presentation/screens/NotificationPage/upload_notificaion.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12,
          top: 12,
        ),
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/notificationBook.png",
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  Text(
                    "Notification wall",
                    style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              UploadNotification(
                  imagepath: "assets/images/profile.png",
                  teacherName: "Abinash Poudel",
                  time: "9 min ago",
                  notificationContent: '''
Dear Students,
Greetings of the Day!
IIC has always strongly believed that outside classroom learning is as important as classroom learning itself. In our classrooms, we gain the theoretical concepts for problem-solving and it is outside of the classroom where students will be using those tools and techniques to identify and solve real-world problems. This is the central idea behind all education systems. And we are no different!'''),
              UploadNotification(
                  imagepath: "assets/images/profile.png",
                  teacherName: "Bikash Rai",
                  time: "30 min ago",
                  notificationContent: '''
Dear students,
Hope you are all doing well.
This email is to inform you that your second-semester classes will commence as follows: Year 1 - 18 February 2024, Year 2 - 20 February 2024, and Year 3 - 22 February 2024. The class schedule will be provided to you as soon as it is finalized.
If you have any questions or require further information, do not hesitate to reach out to us.'''),
              UploadNotification(
                  imagepath: "assets/images/profile.png",
                  teacherName: "Ram Rai",
                  time: "1 day ago",
                  notificationContent: '''
Dear Students,
Greetings of the Day!
IIC has always strongly believed that outside classroom learning is as important as classroom learning itself. In our classrooms, we gain the theoretical concepts for problem-solving and it is outside of the classroom where students will be using those tools and techniques to identify and solve real-world problems. This is the central idea behind all education systems. And we are no different!'''),
              UploadNotification(
                  imagepath: "assets/images/profile.png",
                  teacherName: "Mohit Man Shrestha",
                  time: "2 day ago",
                  notificationContent: '''
Dear Students,
Greetings of the Day!
IIC has always strongly believed that outside classroom learning is as important as classroom learning itself. In our classrooms, we gain the theoretical concepts for problem-solving and it is outside of the classroom where students will be using those tools and techniques to identify and solve real-world problems. This is the central idea behind all education systems. And we are no different!'''),
            ],
          ),
        ),
      ),
    );
  }
}
