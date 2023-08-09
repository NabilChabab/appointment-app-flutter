import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/customapp_bar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: 'Appointment',
        icon: Icon(FluentSystemIcons.ic_fluent_ios_arrow_left_filled, size: 20),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Gap(20),
                _tableCalendar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      "Select Consultation Time",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Text(
                    "Weekend is not available , please select another date",
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: _currentIndex == index
                                    ? Colors.transparent
                                    : Colors.grey.shade800,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? AppColor.buttonColor
                                  : null),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 < 11 ? "PM" : "AM"}',
                            style: GoogleFonts.poppins(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.grey.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50 , vertical: 50),
              height: 60,
              child: CustomButton(
                width: double.infinity,
                text: "Make Appointment",
                onPressed: () {
                  Navigator.of(context).pushNamed('success_booked');
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      headerStyle: HeaderStyle(
          titleTextStyle:
              GoogleFonts.poppins(color: Colors.white, fontSize: 18),
          leftChevronIcon: const Icon(
            FluentSystemIcons.ic_fluent_arrow_left_filled,
            color: Colors.grey,
          ),
          rightChevronIcon: Icon(
            FluentSystemIcons.ic_fluent_arrow_right_filled,
            color: AppColor.buttonColor,
          )),
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        defaultTextStyle: const TextStyle(color: Colors.white),
        disabledTextStyle: TextStyle(color: Colors.grey.shade700),
        weekendTextStyle: TextStyle(color: Colors.grey.shade800),
        todayDecoration: BoxDecoration(
          color: AppColor.buttonColor,
          shape: BoxShape.circle
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}
