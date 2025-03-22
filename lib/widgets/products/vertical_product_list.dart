import 'package:flutter/widgets.dart';

import '../../utils/data.dart';
import 'vertical_product_cards.dart';

class Verticallist extends StatelessWidget {
  const Verticallist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < products.length; i++)
          VerticalCards(products: products[i]),
      ],
    );
  }
}
