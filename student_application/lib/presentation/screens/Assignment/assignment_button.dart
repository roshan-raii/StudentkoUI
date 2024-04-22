import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  AssignmentButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 128, 220, 176),
              Color.fromARGB(255, 88, 228, 160),
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.redHatDisplay(
                textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.0,
            )),
          ),
        ),
      ),
    );
  }
}
