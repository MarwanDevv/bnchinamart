import 'package:bnchinamart/utils/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.name,
    required this.imgPath,
    this.isDiscount = false,
    required this.onTap,
    this.discount = 30,
  });

  final String name;
  final String imgPath;
  final bool isDiscount;
  final VoidCallback onTap;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: lightGreyColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                isDiscount
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor,
                        ),
                        child: Text(
                          "$discount% Discount",
                          style: TextStyle(fontSize: 10, color: whiteColor),
                        ),
                      )
                    : Container()
              ],
            ),
            Image.asset(
              imgPath,
              width: 45,
              height: 60,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
