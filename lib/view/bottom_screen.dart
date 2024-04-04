
import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/bottom_provider.dart';
import 'package:olxfirebase/view/add_product.dart';
import 'package:olxfirebase/view/home.dart';
import 'package:olxfirebase/view/settings_screen.dart';
import 'package:olxfirebase/view/wishlist_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  List screens = [
    const HomeScreen(),
    const WishListScreen(),
    const SettingScreen(),
    const AdminAddDataScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomProvider>(
          builder: (context, value, child) => screens[value.currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(17),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Consumer<BottomProvider>(
            builder: (context, value, child) => BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: value.onTap,
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
                  label: 'ʷᶦˢʰˡᶦˢᵗ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  label: 'ˢᵉᵗᵗᶦⁿᵍˢ',
                ),
                  BottomNavigationBarItem(
                  icon: Icon(
                
                    Icons.add,
                    size: 25,
                  ),
                  label: 'Add Product',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}