import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assignment_data.dart';
import 'package:student_application/presentation/screens/Assignment/assignment_button.dart';
import 'package:student_application/presentation/screens/Assignment/assignment_detail_row.dart';

class AssignmentPage extends StatefulWidget {
  AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  String _fileText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 246),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.0,
          // left: 10,
          // right: 10,
        ),
        child: Column(
          children: [_header(), _body(context)],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Assignments",
              style: GoogleFonts.redHatDisplay(
                  textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              )),
            )
          ],
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget _body(context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 5.55 / 9,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: assignment.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2.0)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade300,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    assignment[index].subjectName,
                                    style: GoogleFonts.redHatDisplay(
                                        textStyle: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                assignment[index].topicName,
                                style: GoogleFonts.redHatDisplay(
                                    textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AssignmentDetailRow(
                                title: "Assign Date",
                                statusValue: assignment[index].assignDate,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AssignmentDetailRow(
                                title: "Late Date",
                                statusValue: assignment[index].lastDate,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AssignmentDetailRow(
                                title: "Status",
                                statusValue: assignment[index].status,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // condition to display button
                              if (assignment[index].status == 'Pending')
                                AssignmentButton(
                                  onPress: () {
                                    _pickFile();
                                  },
                                  title: "Submit",
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.size);
      print(file.path);

      File _file = File(result.files.single.path!);
      setState(() {
        _fileText = _file.path;
      });
    } else {
      // Handle case where no file is selected
    }
  }
}
