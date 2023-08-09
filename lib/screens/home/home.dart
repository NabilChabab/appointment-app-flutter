import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/doctor_card.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/appointment_card.dart';
import '../../widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://i.pinimg.com/564x/61/e6/c4/61e6c40aa60186d5511c036dd08778e8.jpg',
    'https://i.pinimg.com/564x/e3/54/ce/e354ce92745e549b899b11f527ffd752.jpg',
    'https://i.pinimg.com/564x/28/62/69/286269f51dd61ef77c8775b4689b906e.jpg',
  ];

  List<Map<String, dynamic>> medCat = [
    {
      "icon": FluentSystemIcons.ic_fluent_person_accounts_filled,
      "category": "General",
    },
    {
      "icon": FluentSystemIcons.ic_fluent_heart_filled,
      "category": "Cardiology",
    },
    {
      "icon": FluentSystemIcons.ic_fluent_person_accounts_filled,
      "category": "Respirations",
    },
    {
      "icon": FluentSystemIcons.ic_fluent_handshake_filled,
      "category": "Dermatology",
    },
    {
      "icon": FluentSystemIcons.ic_fluent_person_accounts_filled,
      "category": "Gynecology",
    },
    {
      "icon": FluentSystemIcons.ic_fluent_person_accounts_filled,
      "category": "Dental",
    }
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 42,
                      height: 42,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/images/avatar.jpg",
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(50),
                CarouselWithDotsPage(imgList: imgList),
                const Gap(30),
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const Gap(5),
                Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.buttonColor),
                ),
                const Gap(20),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.only(right: 20),
                        color: Colors.grey.shade900,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                medCat[index]['category'],
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Gap(20),
                Text(
                  "Appointment Today",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const Gap(5),
                Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.buttonColor,
                  ),
                ),
                const Gap(20),
                const CustomCard(),
                const Gap(20),
                Text(
                  "Top Doctors",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const Gap(5),
                Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.buttonColor,
                  ),
                ),
                const Gap(20),
                Column(
                  children: List.generate(5, (index) {
                    return const DoctorCard(
                      route: 'doctor_details',
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
