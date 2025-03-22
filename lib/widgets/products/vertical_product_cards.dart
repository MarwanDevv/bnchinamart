import 'package:bnchinamart/pages/product/product_details_page.dart';
import 'package:bnchinamart/utils/functions.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class VerticalCards extends StatelessWidget {
  const VerticalCards({super.key, required this.products});

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
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Hero(
                      tag: products["name"],
                      child: Image.asset(
                        products["imgPath"],
                        width: 70,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products["name"],
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      products["details"],
                      style: TextStyle(
                        fontSize: 12,
                        color: darkGreyColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${products["price"]} ",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "IQD",
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
              ],
            ),
            FloatingActionButton.small(
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
          ],
        ),
      ),
    );
  }
}
