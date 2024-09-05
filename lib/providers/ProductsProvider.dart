import 'package:flutter/material.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  // Private list of available products
   List<Product> _availProducts = [
    Product(
      id: '01',
      title: 'iphone12',
      description: 'It is a new version phone!',
      image: 'assets/images/iphone12.jpg',
      price: 10000,
    ),
    Product(
      id: '02',
      title: 'iphone13',
      description: 'It is a new version phone of 2024!',
      image: 'assets/images/iphone13.jpg',
      price: 12000,
    ),
    Product(
      id: '03',
      title: 'iphone14',
      description: 'It is a new version phone of 2025!',
      image: 'assets/images/iphone14.png',
      price: 12000,
    ),
  ];

   List<Product>get favoriteProducts{
     return _availProducts.where((product)=> product.isFavorite).toList();
   }


   // Getter to expose the products list
  List<Product> get availProducts => _availProducts;
}

// void addProduct(value){
//   _availProducts.add(value);
//   notifyListeners();
// }