import 'package:bnchinamart/utils/colors.dart';
import 'package:bnchinamart/widgets/appBar.dart';
import 'package:bnchinamart/widgets/category/category_box.dart';
import 'package:bnchinamart/widgets/products/product_list.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryBox(
              category: category,
            ),
            const SizedBox(
              height: 10,
            ),
            ProductList(
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
