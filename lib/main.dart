import 'package:flutter/material.dart';
import 'package:simple_shop_app/providers/ProductsProvider.dart';
import 'package:simple_shop_app/screens/MainShoppingScreen.dart';
import 'package:simple_shop_app/screens/ProductDetailsScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        MainShoppingScreen.id: (c) => MainShoppingScreen(),
        ProductDetailsScreen.id: (c) => ProductDetailsScreen(),

      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //this Products is from provider.dart
        create: (BuildContext context) => Products(),
        child: MainShoppingScreen());
  }
}


