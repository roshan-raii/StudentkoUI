import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onTap;
  final double? height;
  final FontWeight? weight; // Updated: Added FontWeight
  final double verticalPadding;
  final double horizontalPadding;
  final double textSize;
  final Color? textColor;

  const MyButton({
    Key? key,
    required this.text,
    this.color,
    this.onTap,
    this.height,
    this.weight,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.textSize,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.redHatDisplay(
                textStyle: TextStyle(
                  color: textColor ??
                      Colors.black, // Added null check for textColor
                  fontSize: textSize,
                  fontWeight:
                      weight ?? FontWeight.w500, // Added null check for weight
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
