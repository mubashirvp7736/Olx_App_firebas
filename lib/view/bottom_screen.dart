import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/bottom_provider.dart';
import 'package:olxfirebase/view/add_product.dart';
import 'package:olxfirebase/view/home.dart';
import 'package:olxfirebase/view/settings_screen.dart';
import 'package:olxfirebase/view/wishlist_screen.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({Key});

  // List of screens to be displayed
  final List<Widget> screens = const [
    HomeScreen(),
    WishListScreen(),
    AdminAddDataScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomProvider>(
        builder: (context, value, child) => screens[value.currentIndex],
      ),
      bottomNavigationBar: Consumer<BottomProvider>(
        builder: (context, value, child) => BottomNavigationBar(
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => value.onTap(index),
          backgroundColor: const Color(0xFF00246B),
          currentIndex: value.currentIndex,
          selectedItemColor: const Color(0xFF30D5C8),
          unselectedItemColor: const Color(0xFFCADCFC),
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black54),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'ᴴᵒᵐᵉ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outlined,
                size: 25,
              ),
              label: 'ʷᶦˢʰˡˢᵗ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 25,
              ),
              label: 'Add Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: 'ˢᵉᵗᵗᶦⁿᵍˢ',
            ),
          ],
        ),
      ),
    );
  }
}
