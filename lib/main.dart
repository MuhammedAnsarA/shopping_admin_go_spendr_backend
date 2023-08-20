import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_spendr_backend/screens/homescreen.dart';
import 'package:get/get.dart';
import 'package:go_spendr_backend/screens/new_product_screen.dart';
import 'package:go_spendr_backend/screens/orders_screen.dart';
import 'package:go_spendr_backend/screens/product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go Spendr',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      getPages: [
        GetPage(name: "/products", page: () => ProductScreen()),
        GetPage(name: "/products/new", page: () => NewProductScreen()),
        GetPage(name: "/orders", page: () => OrdersScreen()),
      ],
    );
  }
}
