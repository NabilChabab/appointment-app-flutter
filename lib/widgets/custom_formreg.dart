import 'package:flutter/material.dart';
import 'package:flutter_docapp/main_layout.dart';
import 'package:flutter_docapp/utils/config.dart';
import 'package:flutter_docapp/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormreg extends StatefulWidget {
  const CustomFormreg({super.key});

  @override
  State<CustomFormreg> createState() => _CustomFormregState();
}

class _CustomFormregState extends State<CustomFormreg> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700),
            controller: _nameController,
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 39, 40, 50),
                filled: true,
                hintText: "UserName",
                hintStyle: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.w600),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(18)))),
          ),
          const Gap(20),
          TextFormField(
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 39, 40, 50),
                filled: true,
                hintText: "E-mail",
                hintStyle: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.w600),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(18)))),
          ),
          const Gap(20),
          TextFormField(
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700),
            controller: _passwordController,
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 39, 40, 50),
                filled: true,
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.w600),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                suffixIconColor: Colors.white,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined))),
          ),
          Gap(50),
          CustomButton(
            width: double.infinity,
            text: "Register",
            disable: false,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainLayout(),));
            },
          ),
        ],
      ),
    );
  }
}
