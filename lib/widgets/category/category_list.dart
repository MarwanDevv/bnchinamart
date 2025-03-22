import 'package:bnchinamart/pages/product/products.dart';
import 'package:bnchinamart/utils/data.dart';
import 'package:bnchinamart/widgets/category/category_card.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Map<String, dynamic>> topCategories = [];

  @override
  void initState() {
    super.initState();

    topCategories = categories.where(
      (category) {
        return category["isTop"] == true;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: topCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 16 / 9),
      itemBuilder: (context, index) {
        return CategoryCard(
          name: topCategories[index]["name"],
          imgPath: topCategories[index]["imgPath"],
          discount: topCategories[index]["discount"],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductsPage(category: topCategories[index]["name"]);
                },
              ),
            );
          },
          isDiscount: true,
        );
      },
    );
  }
}
