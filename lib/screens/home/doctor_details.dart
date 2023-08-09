import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/customapp_bar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool _isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const Icon(
          FluentSystemIcons.ic_fluent_ios_arrow_left_filled,
          color: Colors.white,
          size: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isFav = !_isFav;
              });
            },
            icon: Icon(_isFav ? Icons.favorite_rounded : Icons.favorite_outline,
                color: Colors.red),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            const AboutDoctor(),
            const DetailBody(),
            const Spacer(),
            MaterialButton(
              color: AppColor.buttonColor,
              padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 15),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('booking');
              },
              child: Text(
                "Book Appointment",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage("assets/images/doc5.jpeg"),
          ),
          const Gap(20),
          Text(
            "Dr Lghozlani",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              "MBBS (International Medical University , Malaysia) ,MRCP (Royal College of Physicians , United Kingdom)",
              style: GoogleFonts.poppins(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(10),
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              "Morocco General Hospital",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DoctorInfo(),
          const Gap(30),
          Text(
            "About Doctor",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Gap(5),
          Container(
            width: 50,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.buttonColor
            ),
          ),
          Gap(20),
          Text(
              "Dr Lghozlani is an Experience Dentist at Morocco , He is Graduated since 2008 , and Completed his training at Sungai Beloh General Hospital.",
              style: GoogleFonts.poppins(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              
            ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        InfoCard(
          label: "Patients",
          value: "109",
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: "Experience",
          value: "10 years",
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: "Rating",
          value: "4.5",
        )
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(5),
            Text(
              value,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
