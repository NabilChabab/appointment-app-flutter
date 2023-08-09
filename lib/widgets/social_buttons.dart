import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key, this.social});

  final String? social;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/goo.png"))),
            ),
            Text(
              "Login with google account !",
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
