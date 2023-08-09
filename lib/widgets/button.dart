import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.width, required this.text, required this.disable, required this.onPressed});

  final double width;
  final String text;
  final bool disable;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35),
        child: MaterialButton(
          color: AppColor.buttonColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          onPressed: disable? null : onPressed,
          child: Text(
            text,style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}