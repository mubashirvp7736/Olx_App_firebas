// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olxfirebase/controller/bottom_provider.dart';
import 'package:olxfirebase/controller/product_provider.dart';
import 'package:olxfirebase/model/model.dart';
import 'package:olxfirebase/view/home.dart';
import 'package:olxfirebase/view/widgets/add_home.dart';
import 'package:olxfirebase/view/widgets/button_widgets.dart';
import 'package:olxfirebase/view/widgets/custom_text.dart';
import 'package:olxfirebase/view/widgets/snackbar_widget.dart';
import 'package:olxfirebase/view/widgets/textstyle_widget.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
class AdminAddDataScreen extends StatelessWidget {
  const AdminAddDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    const OutlineInputBorder inputBorderColor = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Scaffold(
      body: SafeArea(
        child: Consumer<CarProvider>(
          builder: (context, value, child) => carProvider.isAddingData
              ? addingCircularIndicator(context)
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                        key: carProvider.carDataFormKey,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [                              
                              textAbel(
                                name: 'Add Product',
                                fontsize: 30,
                                fontweight: FontWeight.w800,
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height: size.height * .25,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Consumer<CarProvider>(
                                        builder: (context, value, child) =>
                                            GestureDetector(
                                          onTap: () {
                                            pickImage(context);
                                          },
                                          child: Container(
                                            height: size.height * .2,
                                            width: size.width * .9,
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10)),
                                              border: Border.all(
                                                  color: Colors.black, width: 2),
                                              image: value.pickedImage != null
                                                  ? DecorationImage(
                                                      image: FileImage(
                                                          value.pickedImage!),
                                                      fit: BoxFit.contain,
                                                    )
                                                  : const 
                                                  
                                                  DecorationImage(
                                                      image: AssetImage(
                                                          'assets/addimage.jpg'),
                                                      fit: BoxFit.contain,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .55,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomTextFormField(
                                      labelText: 'Product Name',
                                      controller: carProvider.carNameController,
                                      enabledBorder: inputBorderColor,
                                      focusedBorder: inputBorderColor,
                                      focusErrorBorder: inputBorderColor,
                                      validateMsg: 'Enter ProductName',
                                    ),
                                    // CustomTextFormField(
                                    //   labelText: 'Kms',
                                    //   keyboardType: TextInputType.number,
                                    //   inputFormatters: [
                                    //     FilteringTextInputFormatter.allow(
                                    //         RegExp(r'[0-9]'))
                                    //   ],
                                    //   controller: carProvider.kmController,
                                    //   enabledBorder: inputBorderColor,
                                    //   focusedBorder: inputBorderColor,
                                    //   focusErrorBorder: inputBorderColor,
                                    //   validateMsg: 'Enter Km',
                                    // ),
                                    dateTextFormField(),
                                    CustomTextFormField(
                                      labelText: 'Description',
                                      controller: carProvider.descriptionController,
                                      enabledBorder: inputBorderColor,
                                      focusedBorder: inputBorderColor,
                                      focusErrorBorder: inputBorderColor,
                                      validateMsg: 'Enter Description',
                                    ),
                                    CustomTextFormField(
                                      labelText: 'Price',
                                      controller: carProvider.priceController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'))
                                      ],
                                      keyboardType: TextInputType.number,
                                      enabledBorder: inputBorderColor,
                                      focusedBorder: inputBorderColor,
                                      focusErrorBorder: inputBorderColor,
                                      validateMsg: 'Enter price',
                                    ),
                                    const SizedBox(height: 10),
                                    ButtonWidgets().rectangleButton(
                                      size,
                                      name: 'ADD CAR',
                                      onPressed: () async {
                                        if (carProvider.carDataFormKey.currentState!
                                            .validate()) {
                                          await addData(context, carProvider);
                                    Provider.of<BottomProvider>(context).currentIndex=0;
                                        }
                                      },
                                      bgColor: Colors.black,
                                      fgColor: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<CarProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addData(BuildContext context, CarProvider carProvider) async {
    final pickedImage = carProvider.pickedImage;
    if (pickedImage != null) {
      carProvider.setIsAddingData(true);
      final image = await carProvider.uploadImage(
          File(pickedImage.path), carProvider.imageName);

      final cars = CarModel(
        carName: carProvider.carNameController.text,
        description: carProvider.descriptionController.text,
        price: int.parse(carProvider.priceController.text),
      //  km: carProvider.kmController.text,
        date: carProvider.dateController.text,
        image: image,
        wishList: [],
      );

      carProvider.addCar(cars);

      carProvider.clearCarControllers();

      SnackBarWidget().showSuccessSnackbar(context, 'Car Added Successfully');
    } else {
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Failed to Add try once more');
      log('Error: pickedImage is null');
    }
    carProvider.setIsAddingData(false);
  }
}