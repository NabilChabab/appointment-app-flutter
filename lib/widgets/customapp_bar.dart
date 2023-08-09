import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.appTitle, this.route, this.icon, this.actions});
      
  @override
  Size get preferredSize => Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final Icon? icon;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.appTitle!,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: widget.icon != null
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent),
                child: IconButton(
                  onPressed: () {
                    if (widget.route != null) {
                      Navigator.of(context).pushNamed(widget.route!);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: widget.icon!,
                  iconSize: 20,
                  color: Colors.white,
                ),
              )
            : null,
            actions: widget.actions ?? null,
            );
  }
}
