import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/presentation/screens/Homepage/Modules/database.dart';
import 'package:student_application/presentation/screens/Homepage/Modules/java.dart';
import 'package:student_application/presentation/screens/Homepage/Modules/networking.dart';
import 'package:student_application/presentation/screens/Homepage/Modules/software_engineering.dart';
import 'package:student_application/presentation/screens/ProfilePage/Profile.dart';
import 'package:student_application/presentation/widgets/MyModules_View.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListViewSelected = false;
  bool isGridViewSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 246),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(context),
          _mid(),
          isGridViewSelected ? _gridView() : _listView(context),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9.6,
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
                SizedBox(height: MediaQuery.of(context).size.height / 6.5),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Roshan,",
                    style: GoogleFonts.redHatDisplay(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "Good Morning!",
                    style: GoogleFonts.redHatDisplay(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _mid() {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 5), // here
      child: Row(
        children: [
          Text(
            "Your Modules",
            style: GoogleFonts.redHatDisplay(
              textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 3),
          IconButton(
            onPressed: () {
              setState(() {
                isListViewSelected = false;
                isGridViewSelected = true;
              });
            },
            icon: Icon(Icons.grid_view_outlined,
                size: 20, color: isGridViewSelected ? Colors.blue : null),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isGridViewSelected = false;
                isListViewSelected = true;
              });
            },
            icon: Icon(Icons.list,
                size: 20, color: isListViewSelected ? Colors.blue : null),
          ),
        ],
      ),
    );
  }

  Widget _listView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Column(
        children: [
          MyModulesList(
            imagePath: "assets/images/database.svg",
            moduleName: "Database",
            percent: 0.4,
            progress: "40% Completed",
            progressColor: Color.fromARGB(255, 88, 228, 160),
            backgroundColor: Colors.greenAccent.shade100,
            imageHeight: MediaQuery.of(context).size.height / 25,
            fontSize: 18,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Database()));
            },
          ),
          MyModulesList(
            imagePath: "assets/images/java.svg",
            moduleName: "Java",
            percent: 0.6,
            progress: "60% Completed",
            progressColor: Colors.blue,
            backgroundColor: Colors.blue.shade100,
            imageHeight: MediaQuery.of(context).size.height / 20,
            fontSize: 18,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Java()));
            },
          ),
          MyModulesList(
            imagePath: "assets/images/software_engineer.svg",
            moduleName: '''Software 
Engineering''',
            percent: 0.4,
            progress: "40% Completed",
            progressColor: Colors.red,
            backgroundColor: Colors.red.shade100,
            imageHeight: MediaQuery.of(context).size.height / 25,
            fontSize: 18,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SoftwareEngineering()));
            },
          ),
          MyModulesList(
            imagePath: "assets/images/networking.svg",
            moduleName: "Networking",
            percent: 0.75,
            progress: "75% Completed",
            progressColor: Colors.yellow,
            backgroundColor: Colors.yellow.shade100,
            imageHeight: MediaQuery.of(context).size.height / 25,
            fontSize: 18,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Networking()));
            },
          )
        ],
      ),
    );
  }

  Widget _gridView() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyModulesGrid(
                  imagePath: "assets/images/database.svg",
                  moduleName: "Database",
                  percent: 0.4,
                  progress: "40% Completed",
                  progressColor: Color.fromARGB(255, 88, 228, 160),
                  backgroundColor: Colors.greenAccent.shade100,
                  imageHeight: MediaQuery.of(context).size.height / 30,
                  fontSize: 18,
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Database()));
                  },
                ),
              ),
              Expanded(
                child: MyModulesGrid(
                  imagePath: "assets/images/java.svg",
                  moduleName: "Java",
                  percent: 0.6,
                  progress: "60% Completed",
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.shade100,
                  imageHeight: MediaQuery.of(context).size.height / 25,
                  fontSize: 18,
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Java()));
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MyModulesGrid(
                  imagePath: "assets/images/software_engineer.svg",
                  moduleName: '''Software Engineering''',
                  percent: 0.3,
                  progress: "40% Completed",
                  progressColor: Colors.red,
                  backgroundColor: Colors.red.shade100,
                  imageHeight: MediaQuery.of(context).size.height / 32,
                  fontSize: 15,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SoftwareEngineering()));
                  },
                ),
              ),
              Expanded(
                child: MyModulesGrid(
                  imagePath: "assets/images/networking.svg",
                  moduleName: "Networking",
                  percent: 0.75,
                  progress: "75% Completed",
                  progressColor: Colors.yellow,
                  backgroundColor: Colors.yellow.shade100,
                  imageHeight: MediaQuery.of(context).size.height / 39,
                  fontSize: 18,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Networking()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
