
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
            hintText: hintText,
            helperStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}

 class TextWidgets {
  Widget titleText(BuildContext context, {required String text, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        textAlign: TextAlign.left,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: color ?? Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget headingText(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.045,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget mainHeadingText(BuildContext context,
      {required String text, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: color ?? Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontWeight: FontWeight.bold,
        ),
        // style: TextStyle(
        //   color: color ?? Colors.black,
        //   fontSize: MediaQuery.of(context).size.width * 0.06,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
    );
  }

  Widget subtitleText(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.03,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget bodyText(BuildContext context, {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      // maxLines: 2,
      overflow: TextOverflow.visible,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.035,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget bodyTextBold(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.035,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget titleText2(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      softWrap: true,
      text,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buttonLabel(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
}