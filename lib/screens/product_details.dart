import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../api/requests.dart';

class ProductDetail extends StatefulWidget {
  final int productId;

  const ProductDetail({super.key, required this.productId});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: FutureBuilder(
        future: ProductDetailById.fetch(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar dados'),
            );
          } else if (snapshot.hasData) {
            return SizedBox(
              height: double.infinity,
              width: 500,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data!['imagem'],
                      width: 300,
                      height: 400,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const CircularProgressIndicator(),
                    ),
                    Text(snapshot.data!['nome']),
                    Text(snapshot.data!['preco']),
                    Text(snapshot.data!['descricao']),
                    Text(snapshot.data!['categoria']),
                    Text(snapshot.data!['material']),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text('Adicionar ao Carrinho'),
                          onPressed: () {
                            // Adicionar código para adicionar item ao carrinho aqui
                          },
                        ).width(200),
                        ElevatedButton(
                          onPressed: () {
                            // Adicionar código para adicionar item ao carrinho aqui
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 241, 93, 93),
                          ),
                          child: const Text('Comprar'),
                        ).width(200),
                      ],
                    ).alignment(Alignment.center),
                  ],
                ),
              ),
            ).alignment(Alignment.center);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
