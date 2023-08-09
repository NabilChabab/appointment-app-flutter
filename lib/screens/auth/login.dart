import 'package:flutter/material.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/button.dart';
import 'package:flutter_docapp/widgets/login_forms.dart';
import 'package:flutter_docapp/widgets/social_buttons.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    "Sign in to your account..",
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(100),
                  const CustomForm(),
                  const Gap(20),
                  const Center(child: SocialMedia()),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            color: AppColor.buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('sign_up');
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
