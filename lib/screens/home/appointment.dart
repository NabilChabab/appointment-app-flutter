import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/appointment_card.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedule = [
    {
      "doctor_name": "Dr Lghozlani",
      "category": "Dental",
      "status": FilterStatus.upcoming,
      "doctor_profile": "assets/images/doc2.jpeg",
    },
    {
      "doctor_name": "Dr Lghozlani",
      "category": "Cardiology",
      "status": FilterStatus.complete,
      "doctor_profile": "assets/images/doc3.jpeg",
    },
    {
      "doctor_name": "Dr Lghozlani",
      "category": "Respiration",
      "status": FilterStatus.complete,
      "doctor_profile": "assets/images/doc4.jpeg",
    },
    {
      "doctor_name": "Dr Lghozlani",
      "category": "Dental",
      "status": FilterStatus.cancel,
      "doctor_profile": "assets/images/doc5.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filterSchedule = schedule.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //   schedule['status'] = FilterStatus.upcoming; break;
      //   case 'complete':
      //   schedule['status'] = FilterStatus.complete; break;
      //   case 'cancel':
      //   schedule['status'] = FilterStatus.cancel; break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Appointment Schedule",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(30),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        status.name,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Gap(30),
            Expanded(
              child: ListView.builder(
                  itemCount: filterSchedule.length,
                  itemBuilder: (context, index) {
                    var _schedule = filterSchedule[index];
                    bool isLastElement = filterSchedule.length + 1 == index;
                    return Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: AppColor.buttonColor, width: 4),
                          borderRadius: BorderRadius.circular(20)),
                      margin: !isLastElement
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(_schedule['doctor_profile']),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _schedule['doctor_name'],
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _schedule['category'],
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Gap(20),
                            const ScheduleCard(),
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: MaterialButton(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.grey.shade900,
                                      onPressed: () {},
                                      child: Text(
                                        "Cancel",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: MaterialButton(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color:
                                          AppColor.buttonColor,
                                      onPressed: () {},
                                      child: Text(
                                        "Reschedule",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
