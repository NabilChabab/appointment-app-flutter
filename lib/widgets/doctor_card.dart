import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});

  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        child: Card(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          color: Colors.grey.shade900,
          child: Row(
            children: [
              Container(
                width: 90,
                height: 90,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/doc4.jpeg",
                        ),
                        fit: BoxFit.cover)),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
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
                      Gap(20),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            "4.5",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            "Reviews",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            "(20)",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(
                            flex: 7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
