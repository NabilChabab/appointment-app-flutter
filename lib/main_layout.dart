import 'package:flutter/material.dart';
import 'package:flutter_docapp/screens/auth/login.dart';
import 'package:flutter_docapp/screens/booking/booking_page.dart';
import 'package:flutter_docapp/screens/home/appointment.dart';
import 'package:flutter_docapp/screens/home/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

 int _selectedIndex = 0;

 static final List<Widget> _widgetOptions = <Widget>[

    const HomePage(),
    const LoginPage(),
    const AppointmentPage(),
    


  ];

  void _onItemTaped(int index){

    setState(() {
      _selectedIndex = index;
    });
  }

  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: _widgetOptions[_selectedIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        onTap: _onItemTaped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular,color:Color.fromARGB(255, 255, 253, 252)),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_heart_regular,color: Color.fromARGB(255, 255, 253, 252)),
            label: "appointment"
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_calendar_date_regular,color:Color.fromARGB(255, 255, 253, 252)),
            label: "home"
          ),
        ],
      ),
    );
  }
}