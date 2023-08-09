import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/button.dart';
import 'package:flutter_docapp/widgets/login_forms.dart';
import 'package:flutter_docapp/widgets/social_buttons.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_formreg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Get You In!",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Register with a new account..",
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(100),
                  const CustomFormreg(),
                  const Gap(20),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ? ",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "Sign in",
                          style: GoogleFonts.poppins(
                            color: AppColor.buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('sign_in');
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
