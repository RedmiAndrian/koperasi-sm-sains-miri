import 'package:flutter/material.dart';
import 'package:koop/pages/addProduct.dart';
import 'package:koop/pages/home.dart';
import 'package:koop/pages/login.dart';
import 'package:koop/pages/newUserPage.dart';
import 'package:koop/pages/register.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Koperasi SM Sains Miri Sdn Bhd",
        routes: {
          '/': (context) => NewUserPage(),
          '/home': (context) => Home(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => Register(),
          '/add': (context) => AddProduct(),
        }));
