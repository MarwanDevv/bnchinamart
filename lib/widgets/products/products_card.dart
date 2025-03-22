import 'package:bnchinamart/pages/product/product_details_page.dart';
import 'package:bnchinamart/utils/functions.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(products: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                color: lightGreyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      product["imgPath"],
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: FloatingActionButton.small(
                      heroTag: "fab $product",
                      backgroundColor: primaryColor,
                      shape: const CircleBorder(),
                      onPressed: () {
                        addToBasket(context, product);
                      },
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            product["name"],
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${product["price"]} ",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " IQD",
                  style: TextStyle(
                    color: darkGreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
