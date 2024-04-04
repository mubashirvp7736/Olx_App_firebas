import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:olxfirebase/controller/authentication_provider.dart';
import 'package:olxfirebase/controller/bottom_provider.dart';
import 'package:olxfirebase/controller/product_provider.dart';
import 'package:olxfirebase/controller/register_provider.dart';
import 'package:olxfirebase/firebase_options.dart';
import 'package:olxfirebase/view/bottom_screen.dart';
import 'package:provider/provider.dart';
Future<void>main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthenticationProvider(),),
      ChangeNotifierProvider(create: (context) => RegisterProvider(),),
      ChangeNotifierProvider(create: (context) => BottomProvider(),),
      ChangeNotifierProvider(create: (context) => CarProvider(),),
      
      ],
      child: MaterialApp(
      home:BottomScreen() ,
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
