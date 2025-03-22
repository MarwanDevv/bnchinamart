import 'package:bnchinamart/pages/product/product_details_page.dart';
import 'package:bnchinamart/utils/functions.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HorizantalCards extends StatelessWidget {
  const HorizantalCards({
    super.key,
    required this.products,
  });

  final Map<String, dynamic> products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              products: products,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: products["name"],
                    child: Image.asset(
                      products["imgPath"],
                      width: 75,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: FloatingActionButton.small(
                    heroTag: "fab ${products["imgPath"]}",
                    onPressed: () {
                      addToBasket(context, products);
                    },
                    backgroundColor: primaryColor,
                    shape: const CircleBorder(),
                    child: Icon(
                      Icons.add,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            products["name"],
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "${products["price"]}",
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: " IQD",
                style: TextStyle(
                  fontSize: 14,
                  color: darkGreyColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
