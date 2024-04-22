import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentDetailRow extends StatelessWidget {
  final String title;
  final String statusValue;
  AssignmentDetailRow(
      {super.key, required this.title, required this.statusValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.redHatDisplay(
              textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey)),
        ),
        Text(
          statusValue,
          style: GoogleFonts.redHatDisplay(
              textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 103, 102, 102))),
        )
      ],
    );
  }
}
