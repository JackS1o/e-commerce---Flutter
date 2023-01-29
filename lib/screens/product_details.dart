import 'package:flutter/material.dart';

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
              width: double.infinity,
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
                  ],
                ),
              ),
            );
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
