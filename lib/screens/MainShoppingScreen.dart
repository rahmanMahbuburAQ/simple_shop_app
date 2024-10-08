// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shop_app/providers/product_provider/ProductsProvider.dart';
import 'package:simple_shop_app/providers/product_provider/product.dart';
import 'package:simple_shop_app/screens/cart_screen.dart';
import 'package:simple_shop_app/screens/order_screen.dart';
import '../widgets/GridProductItem.dart';

class MainShoppingScreen extends StatefulWidget {
  static const id = '/MainShoppingScreen';

  MainShoppingScreen({Key? key}) : super(key: key);

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.red[500],
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(OrdersScreen.id);
            }, label: Text('My Orders')),
        appBar: AppBar(
          title: Text("Phone71"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red[500],
          actions: [
            PopupMenuButton(
              onSelected: (int selectedVal) {
                if (selectedVal == 0) {
                  setState(() {
                    showFav = true;
                  });
                }
                if (selectedVal == 1) {
                  setState(() {
                    showFav = false;
                  });
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(child: Text('filter by favorite'), value: 0),
                  PopupMenuItem(child: Text('remove filters'), value: 1),
                ];
              },
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.id);
                },
                icon: Icon(Icons.shopping_cart_checkout))
          ],
        ),
        body: ProductsGrid(
          isFav: showFav,
        ),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.isFav,
  }) : super(key: key);

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productDate = Provider.of<Products>(context);
    final availProducts =
    isFav ? productDate.favoriteProducts : productDate.availProducts;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: availProducts.length,
      itemBuilder: (contex, index) {
        return ChangeNotifierProvider<Product>.value(
          value: availProducts[index],
          //create: (BuildContext context) => availProducts[index],
          child: GridProductItem(
            // id: availProducts[index].id,
            // title: availProducts[index].title,
            // image: availProducts[index].image,
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 6,
        mainAxisSpacing: 40,
      ),
    );
  }
}
