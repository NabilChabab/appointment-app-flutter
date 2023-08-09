import 'package:flutter/material.dart';
import 'package:flutter_docapp/main_layout.dart';
import 'package:flutter_docapp/screens/auth/login.dart';
import 'package:flutter_docapp/screens/auth/sign_up.dart';
import 'package:flutter_docapp/screens/booking/booking_page.dart';
import 'package:flutter_docapp/screens/booking/succesed_booked.dart';
import 'package:flutter_docapp/screens/home/doctor_details.dart';
import 'package:flutter_docapp/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        'doctor_details' : (context) => const DoctorDetails(),
        'booking' : (context) => const BookingPage(),
        'main' : (context) => const MainLayout(),
        'success_booked' : (context) => const SuccessBokked(),
        'sign_up' : (context) => const SignUpPage(),
        'sign_in' : (context) => const LoginPage(),
      },
    );
  }
}