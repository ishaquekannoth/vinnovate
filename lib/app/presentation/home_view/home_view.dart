import 'package:flutter/material.dart';
import 'package:vinnovate/app/data/product_model.dart';
import 'package:vinnovate/app/presentation/home_view/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              centerTitle: true,
            ),
            body: Column(
              children: productsJson
                  .map((e) => ProductCard(product: ProductModel.fromJson(e)))
                  .toList(),
            )));
  }
}
