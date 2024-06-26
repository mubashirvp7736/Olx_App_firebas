// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/product_provider.dart';
import 'package:olxfirebase/model/model.dart';
import 'package:olxfirebase/view/widgets/home_product_details.dart';
import 'package:olxfirebase/view/widgets/textstyle_widget.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(
                name: 'wishlist',
                fontsize: 28,
                fontweight: FontWeight.w600,
              ),
              Consumer<CarProvider>(
                builder: (context, carProvider, child) {
                  final wishlistItems = checkUser(carProvider);
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.7,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = wishlistItems[index];
                      return HomeCarContainer(
                        value: carProvider,
                        product: item,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<CarModel> checkUser(CarProvider carProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final user = currentUser.email ?? currentUser.phoneNumber;
    List<CarModel> myCars = [];
    for (var car in carProvider.allCarList) {
      if (car.wishList.contains(user)) {
        myCars.add(car);
      }
    }
    return myCars;
  }
}