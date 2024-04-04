
import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/product_provider.dart';
import 'package:olxfirebase/view/widgets/textstyle_widget.dart';
import 'package:provider/provider.dart';

Widget popButtonAndRoadWay(context) {
  Size size = MediaQuery.of(context).size;
  final carProvider = Provider.of<CarProvider>(context, listen: false);
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
          carProvider.clearCarControllers();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      SizedBox(width: size.width * .19),
      textPoppins(
        name: 'RoadWay',
        fontsize: 25,
        fontweight: FontWeight.w600,
      ),
    ],
  );
}

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