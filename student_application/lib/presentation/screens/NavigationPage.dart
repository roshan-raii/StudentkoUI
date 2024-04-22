import 'package:flutter/material.dart';
import 'package:student_application/presentation/screens/Assignment/assignment.dart';
import 'package:student_application/presentation/screens/NotificationPage/Notification.dart';
import 'package:student_application/presentation/screens/RoutinePage/Routine.dart';
import 'package:student_application/presentation/screens/Homepage/homepage.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int myIndex = 0;
  List<Widget> widgetList = [
    HomePage(),
    RoutinePage(),
    NotificationPage(),
    AssignmentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 246),
      body: widgetList[myIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: Colors.white, // Example background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Color.fromARGB(255, 88, 228, 160),
          unselectedItemColor: Color.fromARGB(255, 194, 198, 206),
          onTap: (indexValue) {
            setState(() {
              myIndex = indexValue;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Routine",
              icon: Icon(Icons.timer_outlined),
            ),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(Icons.notifications_outlined),
            ),
            BottomNavigationBarItem(
              label: "Assignment",
              icon: Icon(Icons.assignment),
            ),
          ],
        ),
      ),
    );
  }
}
