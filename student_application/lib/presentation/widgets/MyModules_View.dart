import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyModulesList extends StatefulWidget {
  final String imagePath;
  final double imageHeight;
  final String moduleName;
  final double fontSize;
  final double percent;
  final String progress;
  final Color progressColor;
  final Color backgroundColor;
  final void Function()? onTap;

  MyModulesList({
    super.key,
    required this.imagePath,
    required this.moduleName,
    required this.percent,
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.imageHeight,
    required this.fontSize,
    this.onTap,
  });

  @override
  State<MyModulesList> createState() => _MyModulesListState();
}

class _MyModulesListState extends State<MyModulesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    widget.imagePath,
                    height: widget.imageHeight,
                    // width: MediaQuery.of(context).size.width / 20,
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 12,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.moduleName,
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: widget.fontSize)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.progress,
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(fontSize: 13)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 8000,
                    radius: 23,
                    lineWidth: 7,
                    percent: widget.percent,
                    progressColor: widget.progressColor,
                    backgroundColor: widget.backgroundColor,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//grid view

class MyModulesGrid extends StatefulWidget {
  final String imagePath;
  final double imageHeight;
  final String moduleName;
  final double fontSize;
  final double percent;
  final String progress;
  final Color progressColor;
  final Color backgroundColor;
  final void Function()? onTap;
  MyModulesGrid(
      {super.key,
      required this.imagePath,
      required this.imageHeight,
      required this.moduleName,
      required this.fontSize,
      required this.percent,
      required this.progress,
      required this.progressColor,
      required this.backgroundColor,
      this.onTap});

  @override
  State<MyModulesGrid> createState() => _MyModulesGridState();
}

class _MyModulesGridState extends State<MyModulesGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height /
            4.2, // Increase the height to accommodate the LinearPercentIndicator
        width: 150,
        child: InkWell(
          onTap: widget.onTap,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 15),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        widget.imagePath,
                        // height: MediaQuery.of(context).size.height / 13,
                        height: widget.imageHeight * 2,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          widget.moduleName,
                          style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: widget.fontSize)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          widget.progress,
                          style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(fontSize: 14),
                              color: const Color.fromARGB(255, 128, 127, 127)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 10),
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 8000,
                          lineHeight: 5,
                          percent: widget
                              .percent, // Updated to use the widget.percent value
                          progressColor: widget.progressColor,
                          backgroundColor: widget.backgroundColor,
                          barRadius: Radius.circular(10),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
