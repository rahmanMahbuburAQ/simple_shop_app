import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shop_app/models/product.dart';
import 'package:simple_shop_app/providers/ProductsProvider.dart';
import 'package:simple_shop_app/widgets/gridProductItem.dart';



class MainShoppingScreen extends StatefulWidget {
  static const id = '/MainShoppingScreen';
   MainShoppingScreen({super.key});

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
   bool showFav = false;

  //  //this data will be retrieved from DB:
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shopping'),
            centerTitle: true,
            backgroundColor: Colors.pinkAccent,
            actions: [
              PopupMenuButton(
                  onSelected: (int selectedVal){
                    if(selectedVal == 0){showFav = true;}
                    if(selectedVal == 1){showFav =  false;}

                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_){
                    return [
                      PopupMenuItem(child: Text('Filter by favorite'), value: 0,),
                      PopupMenuItem(child: Text('Remove filters'), value: 1,)
                    ];

                  },
              )
            ],
          ),
          body: ProductsGrid(isFav: showFav,)
        )
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key, required this.isFav,
  });

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final availProducts = isFav ? productData.favoriteProducts : productData.availProducts;

    return GridView.builder(
        padding:  EdgeInsets.all(10),
        itemCount: availProducts.length,
        itemBuilder: (contex, index) {
          return ChangeNotifierProvider<Product>.value(
            value: availProducts[index],
            child: GridProductItem(
                // id: availPorducts[index].id,
                // title: availPorducts[index].title,
                // image: availPorducts[index].image
            ),
          );
          },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1/1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 30,

        ),

    );
  }
}
