import 'package:bnchinamart/utils/colors.dart';
import 'package:bnchinamart/utils/functions.dart';
import 'package:bnchinamart/widgets/appBar.dart';
import 'package:bnchinamart/widgets/category/category_box.dart';
import 'package:bnchinamart/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.products});

  final Map<String, dynamic> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    products["imgPath"],
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CategoryBox(
                category: products["category"],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                products["name"],
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                products["details"],
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${products["price"]}",
                      style: TextStyle(
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: " IQD",
                      style: TextStyle(
                        fontSize: 20,
                        color: darkGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomButton(
          text: "Add to Basket",
          onTap: () {
            addToBasket(context, products);
          },
        ),
      ),
    );
  }
}
