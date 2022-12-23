import 'package:flutter/material.dart';
import 'package:koop/pages/addProduct.dart';
import 'package:koop/pages/home.dart';
import 'package:koop/pages/login.dart';
import 'package:koop/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Koperasi SM Sains Miri Sdn Bhd",
      routes: {
        '/': (context) => Home(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => Register(),
        '/add': (context) => AddProduct(),
      }));
}
