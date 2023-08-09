import 'package:flutter/material.dart';
import 'package:flutter_docapp/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:gap/gap.dart';



class SuccessBokked extends StatelessWidget {
  const SuccessBokked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Lottie.asset("assets/images/success.json"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Successfully Booked",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: CustomButton(
                disable: false,
                width: double.infinity,
                text: "Back To Home Page",
                onPressed: () => Navigator.of(context).pushNamed('main'),
              ),
            ),
            Gap(30)
          ],
        ),
      ),
    );
  }
}