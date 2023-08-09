import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/config.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/doc2.jpeg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr Flan Bn Flan",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Dental",
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: MaterialButton(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        color: Colors.red.shade700,
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: MaterialButton(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        color: AppColor.buttonColor,
                        onPressed: () {},
                        child: Text(
                          "Completed",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FluentSystemIcons.ic_fluent_calendar_date_filled,
            color: AppColor.buttonColor,
            size: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Monday , 06/16/2023",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.alarm_on_rounded,
            color: AppColor.buttonColor,
            size: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              "2:00 PM",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
