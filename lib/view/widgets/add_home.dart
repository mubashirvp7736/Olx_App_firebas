
import 'package:flutter/material.dart';
import 'package:olxfirebase/view/widgets/textstyle_widget.dart';


Widget addingCircularIndicator(context) {
  Size size = MediaQuery.of(context).size;
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        SizedBox(height: size.height * .02),
        textPoppins(
            name: 'Adding Car to List. Please wait...',
            color: const Color(0xFF00246B),
            fontsize: 15)
      ],
    ),
  );
}