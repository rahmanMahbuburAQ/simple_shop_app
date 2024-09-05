import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const id = '/ProductDetailsScreen';

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //receiving id from GridProductItem screen:
    var id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("${id}"),
      ),
    );
  }
}
