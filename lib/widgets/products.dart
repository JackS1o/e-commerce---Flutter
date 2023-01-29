import 'package:flutter/material.dart';

import '../screens/product_details.dart';

Widget buildProductsList(List products, BuildContext context) =>
    ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            int id = int.parse(products[index]['id']);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          productId: id,
                        )));
          },
          child: SizedBox(
            height: 200,
            width: 200,
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    products[index]['imagem'],
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const CircularProgressIndicator(),
                  ),
                  Text(products[index]['nome']),
                  Text(products[index]['preco']),
                ],
              ),
            ),
          ),
        );
      },
    );
