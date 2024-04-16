import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vinnovate/app/data/product_model.dart';
import 'package:vinnovate/app/presentation/home_view/widgets/product_card.dart';
import 'package:vinnovate/app/repos/home_repo/home_repo.dart';

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
                  .map((e) => GestureDetector(
                      onTap: () async {
                        final result = await HomeRepo().getProductList();
                        log(result.toString());
                      },
                      child: ProductCard(product: ProductModel.fromJson(e))))
                  .toList(),
            )));
  }
}
