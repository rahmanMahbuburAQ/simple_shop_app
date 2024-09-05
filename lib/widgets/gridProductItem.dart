import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shop_app/models/product.dart';
import 'package:simple_shop_app/screens/ProductDetailsScreen.dart';


class GridProductItem extends StatelessWidget {
  const GridProductItem({Key? key,
    //required this.id, required this.title, required this.image
  }) : super(key:key);

  //final String id, title, image;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Consumer<Product>(
      builder: (context, provider, child){
            return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
            child: GestureDetector(
            onTap: (){
            Navigator.of(context).pushNamed( ProductDetailsScreen.id, arguments: product.id);
            },
            child: Image.asset(product.image)),
            footer: GridTileBar(
            title: Text(product.title,  textAlign: TextAlign.center,),
            backgroundColor: Colors.black45,
            leading: IconButton(icon: product.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined),
            onPressed: (){product.toggleIsFav();},),
            trailing: IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){},
            ),
            ),
            ),
            );
    }
    );
  }
}
