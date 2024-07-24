import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/product/product.dart';
import '../screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Column(
        children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .2,
        child: CachedNetworkImage(
            imageUrl: product.image!,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const Center(
              child:  SpinKitCircle(
                                         color: Colors.black,
                                       ),
            ),
          ),
      ),
        const SizedBox(height: 10,),
      Text(
             "\$${product.price.toString()}",
              textAlign: TextAlign.center,
              style: const  TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
            ),
        ],
      )
     
    );
  }
}
