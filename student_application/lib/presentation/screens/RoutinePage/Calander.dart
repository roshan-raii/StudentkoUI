import 'package:calendar_timeline_sbk/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  // bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 2),
              child: Text(
                'Calendar Timeline',
                style: GoogleFonts.redHatDisplay(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 21, 12, 121)),
              ),
            ),
            // Spacer(),
            // IconButton(
            //   icon: Icon(
            //     isLightMode ? Icons.light_mode : Icons.nightlight,
            //     size: 25,
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       isLightMode = !isLightMode;
            //       AdaptiveTheme.of(context).toggleThemeMode();
            //     });
            //   },
            // ),
          ],
        ),
        MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: CalendarTimeline(
            showYears: true,
            initialDate: _selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) => setState(() => _selectedDate = date),
            leftMargin: 10,
            monthColor: const Color.fromARGB(255, 117, 115, 115),
            dayColor: Colors.black,
            dayNameColor: const Color(0xFF333A47),
            activeDayColor: Colors.white,
            shrink: false,
            activeBackgroundDayColor: Color.fromARGB(255, 84, 188, 87),
            dotsColor: const Color(0xFF333A47),
            selectableDayPredicate: (date) =>
                date.isAfter(DateTime.now().subtract(const Duration(days: 1))),
            locale: 'en',
          ),
        ),
        // const SizedBox(height: 40),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16),
        //   child: TextButton(
        //     style: ButtonStyle(
        //       backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
        //     ),
        //     onPressed: () => setState(() => _resetSelectedDate()),
        //     child: const Text(
        //       'RESET',
        //       style: TextStyle(color: Color(0xFF333A47)),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 20),
        // Center(
        //   child: Text(
        //     'Selected date is $_selectedDate',
        //     style: const TextStyle(color: Color.fromARGB(255, 32, 180, 165)),
        //   ),
        // )
      ],
    );
  }
}
