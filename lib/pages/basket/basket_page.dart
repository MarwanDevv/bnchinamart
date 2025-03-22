import 'package:bnchinamart/utils/colors.dart';
import 'package:bnchinamart/utils/data.dart';
import 'package:bnchinamart/utils/helper.dart';
import 'package:bnchinamart/widgets/basket/basket_card.dart';
import 'package:bnchinamart/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  double totalPrice() {
    var total = 0.0;
    for (var i = 0; i < basketProducts.length; i++) {
      total += basketProducts[i]["totalPrice"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    if (basketProducts.isEmpty) {
      return Center(
        child: Text(
          "Add Products to Basket!",
          style: TextStyle(
            color: primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: basketProducts.length,
            itemBuilder: (context, index) {
              final product = basketProducts[index];

              return BasketCard(
                basketProduct: product,
                onAdd: () {
                  setState(
                    () {
                      product["quantity"] += 1;
                      product["totalPrice"] =
                          product["price"] * product["quantity"];
                    },
                  );
                },
                onMinus: () {
                  if (product["quantity"] > 1) {
                    setState(() {
                      product["quantity"] -= 1;

                      product["totalPrice"] =
                          product["price"] * product["quantity"];
                    });
                  }
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
          ),
        ),
        const Divider(),
        Text(
          "Total",
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: totalPrice().ceil().toString(),
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " IQD",
                style: TextStyle(
                  color: darkGreyColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          text: "Cheakout",
          onTap: () {
            setState(() {
              basketProducts = [];

              addSnackbar(context, "Thanks for your Purchase!");
            });
          },
        ),
      ],
    );
  }
}
