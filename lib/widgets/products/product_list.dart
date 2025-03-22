import 'package:bnchinamart/utils/data.dart';
import 'package:bnchinamart/widgets/products/products_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();

    filteredProducts = products.where((products) {
      return products["category"] == widget.category;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text("No product for this category"),
      );
    }
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: filteredProducts[index],
          );
        },
      ),
    );
  }
}
