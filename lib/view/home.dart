import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/authentication_provider.dart';
import 'package:olxfirebase/controller/product_provider.dart';
import 'package:olxfirebase/view/add_product.dart';
import 'package:olxfirebase/view/product_detail.dart';
import 'package:olxfirebase/view/widgets/categorycard.dart';
import 'package:olxfirebase/view/widgets/home_product_details.dart';
import 'package:olxfirebase/view/widgets/home_widget.dart';
import 'package:olxfirebase/view/widgets/textstyle_widget.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    Provider.of<CarProvider>(context, listen: false).getAllCar();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF00246B),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            authProvider.isAdminHome
                ? adminHomeAppBarLogOutBtn(context)
                : textPoppins(
                    name: 'Find Your choice',
                    color: const Color(0xFFCADCFC),
                    fontsize: 25,
                    fontweight: FontWeight.w700),
           
            const SizedBox(height: 10),
            searchTextFormField(
                onChanged: (value) =>
                    carProvider.search(carProvider.searchController.text),
                controller: carProvider.searchController),
                
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
         const  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //padding: ,
                child:
                  Wrap(
              spacing: 20, // Spacing between categories
              runSpacing: 10, // Spacing between rows of categories
              children: [
                CategoryCard(
                  category: 'Electronics',
                  icon: Icons.phone_android,
                ),
                CategoryCard(
                  category: 'Clothing',
                  icon: Icons.shopping_bag,
                ),
                CategoryCard(
                  category: 'Books',
                 icon: Icons.menu_book,
                ),
                 CategoryCard(
                  category: 'Bikes',
                  icon: Icons.directions_bike, // Icon for Bikes
                ),
                 CategoryCard(
                  category: 'Kitchen ',
                  icon: Icons.kitchen, // Icon for Kitchen Things
                ),
                // Add more CategoryCard widgets for other categories
              ],
            ),
                ),SizedBox(height:15),
            Expanded(
              child: Consumer<CarProvider>(
                builder: (context, carValue, child) {
                  if (carValue.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (carValue.searchList.isEmpty &&
                      carValue.searchController.text.isNotEmpty) {
                    return Center(
                        child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            // Lottie.asset('assets/no available cars.json'),
                            textPoppins(name: 'SEARCHED CAR IS NOT AVAILABLE')
                          ],
                        ),
                      ),
                    ));
                  } else if (carValue.searchList.isEmpty) {
                    if (carValue.allCarList.isNotEmpty) {
                      final allCar = carValue.allCarList;
                      return GridView.builder(
                        gridDelegate: gridDelegate(size.width * 0.0018),
                        itemCount: allCar.length,
                        itemBuilder: (context, index) {
                          final cars = allCar[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetailsScreen(
                                    carName: cars.carName,
                                    description: cars.description,
                                   // km: cars.km,
                                    price: cars.price,
                                    image: NetworkImage(cars.image.toString()),
                                    date: cars.date,
                                  ),
                                ),
                              );
                            },
                            child: HomeCarContainer(
                              value: carProvider,
                              product: cars,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: textAbel(
                            name: 'NO CARS ADDED',
                            fontsize: 20,
                            fontweight: FontWeight.w700),
                      );
                    }
                  } else {
                    return GridView.builder(
                      gridDelegate: gridDelegate(size.width * 0.0018),
                      itemCount: carValue.searchList.length,
                      itemBuilder: (context, index) {
                        final car = carValue.searchList[index];

                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CarDetailsScreen(),
                                ),
                              );
                            },
                            child: HomeCarContainer(
                              value: carProvider,
                              product: car,
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: authProvider.isAdminHome
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminAddDataScreen()));
              },
              label: textPoppins(
                  name: 'ADD CAR',
                  color: const Color(0xFFCADCFC),
                  fontweight: FontWeight.w700),
              backgroundColor: const Color(0xFF00246B),
            )
          : null,
    );
  }
}